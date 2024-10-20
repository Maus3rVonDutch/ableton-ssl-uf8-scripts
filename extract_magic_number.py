import sys
import struct

def extract_magic_number(pyc_file):
    with open(pyc_file, 'rb') as f:
        magic_number = f.read(4)
        return struct.unpack('<H', magic_number[:2])[0]

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python extract_magic_number.py <pyc_file>")
        sys.exit(1)

    pyc_file = sys.argv[1]
    magic_number = extract_magic_number(pyc_file)
    print(magic_number)