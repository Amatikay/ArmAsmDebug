int foo(void);

int max(int a, int b)
{
    return (a - b >= 0) ? a : b;
}

int max_with_stack_args(int a, int b, int c, int d, int e)
{
    return max(max(max(a, b), max(c, d)), e);
}

int main()
{
    int res = 0;
    int a = 0xA;
    int b = 0xB;
    int c = 0xC;
    int d = 0xD;
    int e = 0xE;
    res = foo();
    res = max_with_stack_args(a, b, c, d, e);
    return res;
}
