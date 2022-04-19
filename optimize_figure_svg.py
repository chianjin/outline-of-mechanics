import glob
import os
import sys
import subprocess
import pathlib

SVG_DIR = 'draft/figure-work'
OPT_DIR = 'draft/figure'


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
                # print(inkscape)
                if check_inkscape(inkscape):
                    return inkscape

    raise FileExistsError('无法找到 inkscape 执行文件，请检查安装位置，或下载安装。')


def generate_batch(svg_dir, opt_dir):
    job_list = []
    for svg_file in glob.glob(str(pathlib.Path(svg_dir) / '*.svg')):
        opt_file = pathlib.Path(opt_dir) / pathlib.Path(svg_file).name
        if opt_file.exists():
            svg_mtime = os.stat(svg_file).st_mtime
            opt_mtime = os.stat(opt_file).st_mtime
            if svg_mtime > opt_mtime:
                job_list.append((svg_file, opt_file))
        else:
            job_list.append((svg_file, opt_file))

    batch = ['vacuum-defs', 'export-area-drawing', 'export-text-to-path', 'export-plain-svg']
    for svg_file, opt_file in job_list:
        print(f'{svg_file} --> {opt_file}')
        batch.append(f'file-open:{svg_file}')
        batch.append(f'export-filename:{opt_file}')
        batch.append('export-do')
        batch.append('file-close')
    batch.append('quit')

    return '\n'.join(batch)


def svg2pdf(svg_dir, opt_dir):
    inkscape = detect_inkscape()
    batch_text = generate_batch(svg_dir, opt_dir)
    proc = subprocess.Popen([inkscape, '--shell'], stdin=subprocess.PIPE)
    proc.stdin.write(batch_text.encode('utf-8'))
    proc.stdin.flush()


if __name__ == '__main__':
    svg2pdf(SVG_DIR, OPT_DIR)
