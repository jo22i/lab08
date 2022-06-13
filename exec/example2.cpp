#include "../src/print.hpp"

#include <fstream>

int main(int argc, char** argv)
{
  std::ofstream file("..//..//logs//log.txt");
  print(std::string("hello2"), file);
  std::cout << "End of example2 program!!" << std::endl;
}
