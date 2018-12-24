---
layout: post
author: Saurav Shekhar
---
> Here I will add some interesting C++/Python tricks I learn from around the
internet (ex - [cppcon](https://www.youtube.com/user/CppCon/videos), 
and [pycon](https://www.youtube.com/channel/UCsX05-2sVSH7Nx3zuk3NYuQ/videos?flow=grid&sort=p&view=0))

* Links are valid cpp comments
```cpp
void z_function() {
    https://cp-algorithms.com/string/z-function.html
    // ^ here https acts as a empty goto line and rest followed by // is a comment
}
```

* The snippet
```c
int main()
{
    int a = 42;
    printf(“%d\n”, a);
}
```
May compile in C (without explicit declaration of `#include <stdio.h>`). A proper
C compiler will create an implicit declaration for `printf()` and compile this
into an object file. When linked with Standard library, it will find a definition
of `printf()` that accidentally matches the implicit declaration.

A C++ compiler will refuse to compile this code as the language requires explicit
declaration of all functions. From [Deep C](http://www.pvv.org/~oma/DeepC_slides_oct2011.pdf)
and [Deep C++](http://www.pvv.org/~oma/DeepCPP_jun2012.pdf)

* The program
```c
#include <stdio.h>
struct mystruct {
    int enabled:1;
}
int main() 
{
    struct mystruct s;
    s.enabled = 1;
    if (s.enabled == 1) {
        printf("Is enabled \n");
    } else {
        printf("Is disabled\n");
    }
}
```
will print ` Is disabled`!. See [explanation](https://www.quora.com/What-is-something-that-almost-nobody-knows-about-the-C-coding-language/answer/%C3%81lvaro-Lopes)

* Cppcon talks
