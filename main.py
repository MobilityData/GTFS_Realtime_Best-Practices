import os
import glob

def define_env(env):
    "Hook function"

    @env.macro
    def include_file(filepath):
        full_filename = os.path.join(env.project_dir, filepath)
        if not os.path.exists(filepath):
            return f"""<b>File not found: {full_filename}; Project Dir: {env.project_dir}</b>"""
        with open(filepath, "r") as f:
            return f.read()
