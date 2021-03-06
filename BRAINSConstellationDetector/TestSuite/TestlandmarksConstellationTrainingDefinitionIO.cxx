#include "../src/landmarksConstellationTrainingDefinitionIO.h"

int main(int argc, char * *argv)
{
  if( argc != 2 )
    {
    std::cerr << "Usage: testAcpcmodelSetupClass <model txt file>"
              << std::endl;
    std::cerr.flush();
    exit(1);
    }
  std::string                                filename(argv[1]);
  landmarksConstellationTrainingDefinitionIO m;
  if( m.ReadFile(filename) == -1 )
    {
    std::cerr << "Error reading " << filename
              << std::endl;
    std::cerr.flush();
    exit(1);
    }
  std::cout << m;
  exit(0);
}

