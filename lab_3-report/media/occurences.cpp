#include <iostream> // Do not translate!

int main() {
    int x[10], occur, count = 0;

    std::cout << "Type in array numbers:" << std::endl;

    for(int i = 0; i < 10; i++)
        std::cin >> x[i];

    std::cout << "Type in occurrence value:" << std::endl;
    std::cin >> occur;

    std::cout << "Occurrences indices are:" << std::endl;
    for(int i = 0; i < 10; i++) {
        if(x[i] == occur) {
            std::cout << i << std::endl;
            count++;
        }
    }

    std::cout << "Number of occurrences found:" << std::endl;
    std::cout << count;
    return 0;
}
