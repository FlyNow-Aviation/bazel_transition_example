#!/usr/bin/env python3

import argparse

def main():
    parser = argparse.ArgumentParser(
        description="create a header file that contains a c++ function that returns a given string.")
    parser.add_argument("--function_name", help="Name of the function.", required=True)
    parser.add_argument("--to_return", help="string that should be returned by function.", required=True)
    parser.add_argument("--output_filename", help="Output json filename.")

    args = parser.parse_args()

    code = ""

    code += "#pragma once"
    code += "\n"
    code += "#include <string>\n"
    code += "\n"
    code += "inline std::string " + args.function_name + "() {\n"
    code += "   return \"" + args.to_return + "\";\n"
    code += "}\n"

    if args.output_filename is not None:
        with open(args.output_filename, "w") as fh:
            fh.write(code)
    else:
        print(code)

if __name__ == "__main__":
    main()
