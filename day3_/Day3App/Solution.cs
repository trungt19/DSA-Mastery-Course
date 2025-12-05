public class Solution
{
    // Brute Force O(n^2)
    public bool ContainsDuplicateBrute(int[] nums)
    {
        for (int i = 0; i < nums.Length; i++)
        {
            for (int j = i + 1; j < nums.Length; j++)
            {
                if (nums[i] == nums[j])
                    return true;
            }
        }
        return false;
    }

    // Optimal HashSet O(n)
    public bool ContainsDuplicate(int[] nums)
    {
        HashSet<int> set = new HashSet<int>();

        foreach (int n in nums)
        {
            if (set.Contains(n))
                return true;

            set.Add(n);
        }

        return false;
    }
}
