import os
import sys
import subprocess
from pathlib import Path

__WORK_DIR = Path(__file__).parent.parent
SVG_DIR = __WORK_DIR / 'draft/figure'
PDF_DIR = __WORK_DIR / 'tex/figure'

ON_WINDOWS = True if 'win32' in sys.platform else False

def check_inkscape(inkscape, cwd=None):
    try:
        subprocess.run([inkscape, '-V'], cwd)
    except FileNotFoundError:
        return False
    return True

def detect_inkscape():
    inkscape = 'inkscape'
    if check_inkscape(inkscape):
        return inkscape

    if ON_WINDOWS:
        for system_var in ('PROGRAMFILES', 'PROGRAMFILES(X86)'):
            system_program_path = os.environ.get(system_var)
            if system_program_path:
                inkscape = str(Path(system_program_path) / 'Inkscape/bin/inkscape')
                # print(inkscape)
                if check_inkscape(inkscape):
                    return inkscape

    raise FileExistsError('无法找到 inkscape 执行文件，请检查安装位置，或下载安装。')

def generate_batch():
    job_list = []
    for svg_file in SVG_DIR.glob('*.svg'):
        pdf_file = PDF_DIR / f'{svg_file.stem}.pdf'
        if pdf_file.exists():
            if svg_file.stat().st_mtime > pdf_file.stat().st_mtime:
                job_list.append((svg_file, pdf_file))
        else:
            job_list.append((svg_file, pdf_file))
    if not job_list:
        return None

    batch_list = ['export-area-drawing', 'export-text-to-path']
    for svg_file, pdf_file in job_list:
        print(f'{svg_file} --> {pdf_file}')
        batch_list.append(
            f'file-open:{svg_file}\n'
            f'export-filename:{pdf_file}\n'
            'export-do\n'
            'file-close'
            )
    batch_list.append('quit\n')
    batch_text = '\n'.join(batch_list)
    
    if ON_WINDOWS:
        return batch_text.encode('GBK')
    return batch_text
    
def svg2pdf():
    inkscape = detect_inkscape()
    batch_text = generate_batch()
    if batch_text:
        proc = subprocess.Popen([inkscape, '--shell'], stdin=subprocess.PIPE)
        proc.stdin.write(batch_text)
        proc.stdin.flush()


if __name__ == '__main__':
    svg2pdf()
