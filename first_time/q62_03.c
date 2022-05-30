#include <stdio.h>

#define W 5
#define H 4

int map_ = 0;

int search(int x, int y, int depth) {
    int cnt = 0;
    if ((x < 0) || (x >= W) || (y < 0) || (y >= H)) return 0;
    if ((map_ & (1 << (x + y * W))) > 0) return 0;
    if (depth == W * H) return 1;

    map_ += 1 << (x + y * W);
    cnt += search(x + 1, y, depth + 1);
    cnt += search(x - 1, y, depth + 1);
    cnt += search(x, y + 1, depth + 1);
    cnt += search(x, y - 1, depth + 1);
    map_ -= 1 << (x + y * W);

    return cnt;
}


int main(int argc, char* argv[]) {
    int count = 0;
    for (int i = 0; i < W * H; i++) {
        count += search(i % W, i / W, 1);
    }

    printf("%d", count / 2);
    return 0;
}
