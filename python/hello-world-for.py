def main():
    print("\n-------------\n")
    print("Hello world!")
    print("\n-------------\n")

    nums = [1, 2, 3, 4, 5]
    for i, n in enumerate(nums):
        print(f"i={i}, n={n}, n^2={n*n}")

    print("\n-------------\n")

if __name__ == "__main__":
    main()