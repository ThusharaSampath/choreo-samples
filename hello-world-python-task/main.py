import sys

def main():
  if len(sys.argv) < 2:
    print("Usage: python app.py <name1> <name2> ... <nameN>")
    sys.exit(1)

  names = sys.argv[1:]
  for name in names:
    print("Hello, {}!".format(name))
    

if __name__ == "__main__":
    main()