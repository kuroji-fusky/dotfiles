import psutil
import time
import sys
import subprocess
import os


IS_PROG_RUNNING = False


def is_process_running(process_name):
    for process in psutil.process_iter(attrs=['pid', 'name']):
        if process.info['name'] == process_name:
            return True
    return False


def kill_process(process_name):
    for process in psutil.process_iter(attrs=['pid', 'name']):
        if process.name() == process_name:
            process.kill()


PWD = os.getcwd()

try:
    while True:
        if is_process_running("left4dead2.exe"):
            print(f"L4D2 is running")

            if not IS_PROG_RUNNING:
                # Gonna deal with this thing later
                subprocess.run([fr"{PWD}\\misc\\left4dead\\l4d2-mayhem.ahk"])
                IS_PROG_RUNNING = True

        else:
            print(f"L4D2 isn't running no mo")
            kill_process("AutoHotkeyU64.exe")
            IS_PROG_RUNNING = False

        try:
            time.sleep(3)
        except KeyboardInterrupt:
            sys.exit(0)

except KeyboardInterrupt:
    sys.exit(0)
