#include <algorithm>
#include <array>

int main(int /* argc */, char ** /* argv[] */) {
  std::array<int, 1> arr{1};
  std::sort(std::begin(arr), std::end(arr));
  return 0;
}
