import random
from dataclasses import dataclass


@dataclass
class Developer:
    name: str
    editor: str = "Neovim"
    skills: list[str] | None = None

    def introduce(self) -> None:
        print(f"Hello, I'm {self.name}!")
        print(f"My editor is {self.editor}.")


def generate_numbers(count: int = 10) -> list[int]:
    """Generate random integers for testing."""
    return [random.randint(1, 100) for _ in range(count)]


def analyze_numbers(numbers: list[int]) -> dict[str, float]:
    return {
        "minimum": min(numbers),
        "maximum": max(numbers),
        "average": sum(numbers) / len(numbers),
    }


def main() -> None:
    developer = Developer(name="Saboor")
    developer.introduce()

    numbers = generate_numbers(10)
    results = analyze_numbers(numbers)

    print("\nGenerated numbers:", numbers)

    for label, value in results.items():
        print(f"{label.capitalize():>8}: {value:.2f}")

    if results["average"] >= 50:
        print("\nResult: Above the halfway mark!")
    else:
        print("\nResult: Below the halfway mark!")


if __name__ == "__main__":
    main()
