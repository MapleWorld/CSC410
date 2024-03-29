package triangle;

class Triangle {
    public static final int EQUILATERAL = 0;
    public static final int INVALID = -1;
    public static final int ISOSCELES = 1;
    public static final int SCALENE = 2;

    public static void main (String[] args) {
	   // For part c, comment it out when testing part d
       test(1);

       // For part d, comment it out when testing part c
       test(1, 2, 3);
    }

    // For part c
    public static void test (int x) {
        int type = classify (3, 4, x);
    }

    // For part d
    public static void test (int x, int y, int z) {
        int type = classify(x, y, z);
    }

    public static int classify (int a, int b, int c) {

        if (a <= 0 || b <= 0 || c <= 0)
            return INVALID;

        if (a==b && b==c)
            return EQUILATERAL;
        else if (a >= (b+c) || c >= (b+a) || b >= (a+c) )
            return INVALID;
        else if ((a == b && b != c ) || (a != b && c == a) || (c == b && c != a))
            return ISOSCELES;

        return SCALENE;
    }
}
