#include <algorithm>
#include <cassert>
#include <exception>
#include <fstream>
#include <iostream>
#include <string>
#include <unordered_map>
#include <vector>

#define MAX_STAT_INTERVAL 1000000
#define CNT_LEADERS 7
#define FILE_FOR_TRACE "Trace.txt"
#define FILE_FOR_STATISTIC "Statistic.txt"

namespace Statistic {

std::unordered_map<std::string, short> OpcodeIDs;
std::unordered_map<short, std::string> Opcodes;
std::vector<short> Trace;

template <typename It>
int countOccurences(It ContBegin, It ContEnd, It PattBegin, It PattEnd) {
  auto Found = std::search(ContBegin, ContEnd, PattBegin, PattEnd);
  if (Found == ContEnd)
    return 0;
  return 1 + countOccurences(Found + 1, ContEnd, PattBegin, PattEnd);
}

auto findTop(const auto &Map) {
  assert(Map.begin() != Map.end());
  std::vector<std::pair<std::vector<short>, unsigned long long>> Vec(
      Map.begin(), Map.end());
  std::sort(Vec.begin(), Vec.end(),
            [](const auto &F, const auto &S) { return F.second > S.second; });
  return std::vector<std::pair<std::vector<short>, unsigned long long>>(
      Vec.begin(), Vec.begin() + CNT_LEADERS);
}

template <typename Container> struct Hash {
  std::size_t operator()(const Container &C) const { return *C.begin(); }
};

template <size_t N> static void printPatterns(std::ostream &Os) {
  std::unordered_map<std::vector<short>, unsigned long long,
                     Hash<std::vector<short>>>
      Map;

  for (auto Idx = 0u; Idx < MAX_STAT_INTERVAL; ++Idx) {
    std::vector<short> Ops;
    for (auto Op = Idx; Op < Idx + N; ++Op)
      Ops.push_back(Trace[Op]);
    if (Map.contains(Ops))
      continue;
    auto CountOccs =
        countOccurences(Trace.begin() + Idx, Trace.begin() + MAX_STAT_INTERVAL,
                        Ops.begin(), Ops.end());
    Map[Ops] = CountOccs;
  }

  auto Result = findTop(Map);
  Os << "\n" << N << " patterns (top " << CNT_LEADERS << " elements):\n\n";
  for (const auto &pair : Result) {
    Os << Opcodes[pair.first[0]];
    for (auto Op = 1u; Op < N; ++Op)
      Os << "_" << Opcodes[pair.first[Op]];
    Os << " -- " << pair.second << "\n";
  }
}

static void addStat(const std::string &Opcode) {
  if (!OpcodeIDs.contains(Opcode)) {
    OpcodeIDs[Opcode] = OpcodeIDs.size();
    Opcodes[OpcodeIDs.size() - 1] = Opcode;
  }
  Trace.push_back(OpcodeIDs[Opcode]);
}

} // namespace Statistic

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

void dumpTraceStat() {
  std::ofstream StatF(FILE_FOR_STATISTIC);
  if (!StatF.is_open())
    throw std::logic_error("File did'n open!");

  // Print the most common opcode patterns with lengths 1 - 5
  Statistic::printPatterns<1>(StatF);
  Statistic::printPatterns<2>(StatF);
  Statistic::printPatterns<3>(StatF);
  Statistic::printPatterns<4>(StatF);
  Statistic::printPatterns<5>(StatF);

  StatF.close();

  std::cerr << "Трасса в файле: " << FILE_FOR_TRACE << "\n";
  std::cerr << "Статистика повторения опкодов для трассы в файле: "
            << FILE_FOR_STATISTIC << "\n";
}

void logOpcode(char *OpcodeName) {
  static std::ofstream Logs(FILE_FOR_TRACE);

  if (!Logs.is_open())
    throw std::logic_error("File did'n open!");

  Logs << OpcodeName << "\n";
  Statistic::addStat(OpcodeName);
}

#ifdef __cplusplus
}
#endif // __cplusplus
