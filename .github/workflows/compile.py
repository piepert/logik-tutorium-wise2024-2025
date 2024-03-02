import sys
import os

INPUT_DIRECTORY = "src"
OUTPUT_DIRECTORY = "."

FILE_LIST = []

for path, subdirs, files in os.walk(INPUT_DIRECTORY):
    for name in files:
        file_name = os.path.join(path, name)

        if not os.path.isfile(file_name):
            continue

        splitted_path = os.path.normpath(file_name).split(os.sep)

        if splitted_path[1] == "templates" or splitted_path[1] == "packages":
            continue

        splitted_file = os.path.splitext((os.sep).join([OUTPUT_DIRECTORY] + splitted_path[1:]))

        if splitted_file[1] != ".typ":
            continue

        new_path = splitted_file[0] + ".pdf"
        new_path_parent = (os.sep).join([OUTPUT_DIRECTORY] + splitted_path[1:-1])

        if not os.path.exists(new_path_parent):
            os.makedirs(new_path_parent, exist_ok=True)

        FILE_LIST.append((file_name, new_path))

for entry in FILE_LIST:
    print("Compiling... ", entry[0], " -> ", entry[1])

    try:
        with open(entry[0], "r") as f:
            if "//#DONT_COMPILE_TO_PDF" in list(map(lambda n: n.strip(), f.readlines())):
                print("Skipping file doesn't need to be compiled.")
                continue
    except IOError:
        print("Skipping because of error.")
        continue

    if os.system(f"typst compile --root . --font-path fonts/ {entry[0]} {entry[1]}") != 0:
        sys.exit(1)