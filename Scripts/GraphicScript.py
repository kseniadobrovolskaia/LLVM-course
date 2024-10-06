import matplotlib.pyplot as plt
import sys
import numpy as np
import re




def parse_data(file_path):
    pattern = r'(\w+)\s*--\s*(\d+)'
    result = {}
    with open(file_path, 'r') as file:
        content = file.read()
        matches = re.findall(pattern, content)
    for match in matches:
        key, value = match
        result[key] = int(value)
    return result


CNT_INSTRS = 1000000

if __name__ == "__main__":
  if (len(sys.argv[1:]) < 1):
    sys.exit("Имя файла ожидается в аргументах запуска")
  file_path = sys.argv[1:][0]

  data = parse_data(file_path)

  plt.figure(figsize=(10, 6))
  probs = [i / CNT_INSTRS for i in data.values()]
  plt.bar(data.keys(), probs, color='#AFEEEE', edgecolor='black')
  
  plt.xlabel('Паттерны опкодов')
  plt.ylabel('Вероятность')
  plt.title('Самые часто встречаемые паттерны опкодов в трассе из 1 000 000 инструкций')
  
  plt.show()
