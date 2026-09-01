public class HelloWorldFor {
    public static void main(String[] args) {
        System.out.println("\n-------------\n");
        System.out.println("Hello world!");
        System.out.println("\n-------------\n");

        int[] nums = {1, 2, 3, 4, 5};
        for (int i = 0; i < nums.length; i++) {
            int n = nums[i];
            System.out.println("i=" + i + ", n=" + n + ", n^2=" + (n * n));
        }

        System.out.println("\n-------------\n");
    }
}