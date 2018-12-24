```cpp
#include <iostream>
#include <cassert>
#include <vector>
#include <CGAL/basic.h>
#include <CGAL/QP_models.h>
#include <CGAL/QP_functions.h>
#include <CGAL/Gmpz.h>
#include <CGAL/Exact_predicates_exact_constructions_kernel.h>

using namespace std;

typedef CGAL::Exact_predicates_exact_constructions_kernel K;
typedef K::Point_2 P;
typedef CGAL::Gmpz ET;
typedef CGAL::Quadratic_program<int> Program;
typedef CGAL::Quadratic_program_solution<ET> Solution;


bool intersect(K::Segment_2 light, vector<K::Segment_2> &walls) {
  for (auto &seg : walls) {
    if (CGAL::do_intersect(seg, light)) return true;
  }
  return false;
}


int main2() {
  int l, s, w;
  cin >> l >> s >> w;
  vector<K::Point_2> lamps(l), stamps(s);
  vector<K::Segment_2> walls(w);
  vector<int> M(s);
  for (int i = 0, x, y; i < l; i++) {
    cin >> x >> y;
    lamps[i] = P(x, y);
  }
  for (int j = 0, x, y; j < s; j++) {
    cin >> x >> y >> M[j];
    stamps[j] = P(x, y);
  }
  for (int k = 0, a, b, c, d; k < w; k++) {
    cin >> a >> b >> c >> d;
    walls[k] = K::Segment_2(P(a, b), P(c, d)); 
  }
  const int delta = l;
  Program lp (CGAL::SMALLER, true, 1, false, 0);
  for (int j = 0; j < s; j++) {
    lp.set_a(delta, j, 1);
    for (int i = 0; i < l; i++) {
      K::Segment_2 ray(lamps[i], stamps[j]);
      if (intersect(ray, walls)) continue;
      double r_ij = 1.0 / CGAL::to_double(CGAL::squared_distance(lamps[i], stamps[j]));
      lp.set_a(i, j, -r_ij);
      lp.set_a(i, s+j, r_ij);
    }
    lp.set_b(j, 0);
    lp.set_b(s+j, M[j]);
  }

  // set objective fn
  lp.set_c(delta, -1);
  // bound x_i <= 2^12
  for (int i = 0; i < l; i++) {
    lp.set_u(i, true, 4096);
  }

  Solution sol = CGAL::solve_linear_program(lp, ET());
  assert (sol.solves_linear_program());
  if (sol.is_optimal() && (sol.objective_value() <= -1)) {
    cout << "yes\n";
  } else {
    cout << "no\n";
  }
  return 0;
}


int main() {
  ios_base::sync_with_stdio(false);
  int T; cin >> T;
  while (T--) {
    main2();
  }
  return 0;
}
```
