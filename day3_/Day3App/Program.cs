using System;

class Program
{
    static void Main(string[] args)
    {
        var solution = new Solution();

        int[] test1 = { 1, 2, 3, 1 };
        int[] test2 = { 1, 2, 3, 4 };
        int[] test3 = { 1, 1, 1, 3, 3, 4, 3, 2, 4, 2 };

        Console.WriteLine(solution.ContainsDuplicateBrute(test1)); // true
        Console.WriteLine(solution.ContainsDuplicate(test2));      // false
        Console.WriteLine(solution.ContainsDuplicate(test3));      // true
    }
}
