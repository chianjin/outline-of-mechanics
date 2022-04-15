import glob
import os
import sys
import subprocess
import pathlib

SVG_DIR = 'draft/figure'
PDF_DIR = 'tex/figure'


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

    if 'win32' in sys.platform:
        for system_var in ('PROGRAMFILES', 'PROGRAMFILES(X86)'):
            system_program_path = os.environ.get(system_var)
            if system_program_path:
                inkscape = str(pathlib.Path(system_program_path) / 'Inkscape/bin/inkscape')
                print(inkscape)
                if check_inkscape(inkscape):
                    return inkscape

    raise FileExistsError('无法找到 inkscape 执行文件，请检查安装位置，或下载安装。')


def generate_batch(svg_dir, pdf_dir):
    job_list = []
    for svg_file in glob.glob(str(pathlib.Path(svg_dir) / '*.svg')):
        pdf_file = pathlib.Path(pdf_dir) / f'{pathlib.Path(svg_file).stem}.pdf'
        if pdf_file.exists():
            svg_mtime = os.stat(svg_file).st_mtime
            pdf_mtime = os.stat(pdf_file).st_mtime
            if svg_mtime > pdf_mtime:
                job_list.append((svg_file, pdf_file))
        else:
            job_list.append((svg_file, pdf_file))

    batch = ['export-area-drawing', 'export-text-to-path', 'export-dpi=600']
    for svg_file, pdf_file in job_list:
        print(f'{svg_file} --> {pdf_file}')
        batch.append(f'file-open:{svg_file}')
        batch.append(f'export-filename:{pdf_file}')
        batch.append('export-do')
    batch.append('quit')

    return '\n'.join(batch)


def svg2pdf(svg_dir, pdf_dir):
    inkscape = detect_inkscape()
    batch_text = generate_batch(svg_dir, pdf_dir)
    proc = subprocess.Popen([inkscape, '--shell'], stdin=subprocess.PIPE)
    proc.stdin.write(batch_text.encode('GBK'))
    proc.stdin.flush()


if __name__ == '__main__':
    svg2pdf(SVG_DIR, PDF_DIR)
