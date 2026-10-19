int foo(void);
int main(void)
{
    volatile int a = 0;
    a = foo();
    while (1);
}