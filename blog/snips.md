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
will print `Is disabled`!. See [explanation](https://www.quora.com/What-is-something-that-almost-nobody-knows-about-the-C-coding-language/answer/%C3%81lvaro-Lopes)

* Short and concise way to map count of characters in a string `str`
```cpp
map<char, int> count;
for (auto ch : str) {
    count[ch]++;
}
for (auto e : count) {
    cout << e.first << " " << e.second << "\n";
}
```

* C++17 supports _init_ statements inside `if` and `switch`. For example
```cpp
set<int> input = {1, 5, 3, 6};
if (auto it = input.find(7); it == input.end()) {
    cout << "7 not found!\n";
} else {
    cout << "7 found!\n";
}
```

* Using `tie` to give multiple variable values
```cpp
vector<tuple<int, int, string>> aa;
for (int i = 0; i < 5; ++i) {
    aa.push_back(make_tuple(-i, i*i, "str-" + to_string(i)));
}
sort(begin(aa), end(aa));
int u, v;
string name;
for (auto e : aa) {
    tie(u, v, name) = e;
    cout << u << " " << v << " " << name << "\n";
}
```

* `for` loops can have an `else` in Python. It is slightly weird construct,
and not very recommended to use
```python
found_obj = None
for obj in objects:
    if obj.key == search_key:
        found_obj = obj
        break
else:
    print('No object found.')
```


* `valarray<>` can be used to write and execute numerical computation code
efficiently
```cpp
#include <iostream>
#include <vector>
#include <functional>
#include <valarray>

using namespace std;

int main() {
  valarray<double> w{1, 3, 0, -1, 0.2};
  valarray<double> x{2, 2.5, 3, 0.1, 1./3};
  valarray<double> b{0, 0, -1, -1, 1};
  w *= 0.5; // 2, 6, 0, -2, 0.4
  b = 1.0 - b; // 1, 1, 2, 2, 0

  valarray<double> logits = w*x + b;
  valarray<double> explogits = exp(logits);
  double z = explogits.sum();
  valarray<double> softmax = explogits / z;
  softmax[softmax > 0.5] = 1;
  softmax[softmax < 0.01] = 0;

  //0.0533795 1 0.0533795 0.0507762 0
  for (auto e : softmax) {
    cout << e << " ";
  }
  cout << "\n";

  return 0;
}
```

* [Finding route through grid](code/orienteering)
* [CGAL Linear programming example](code/CGAL_lp.md)
* [SVD Demo LAPACK](code/svd_lapack.md)

* Cppcon talks
