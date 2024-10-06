# LLVM COURSE

 
![example](Images/LLVM.jpg) 


## Содержание

[1. Графическое приложение](#1)

Простое графическое приложение с использованием библиотеки *SDL*

[2. LLVM Pass](#3)

Простой пасс для получения трассы выполнения инструкций графического приложения
Статистика вместе встречающихся опкодов



[2. Сборка ](#2)

Компиляция *snake*
Получение трассы инструкций *snakePass*


<a name="1"></a>
 ## Графическое приложение

> [!NOTE]
> **Змейка** фиксированного размера рандомно перемещается по окну.
> Если она попадает в ситуацию, когда невозможно выбрать путь без самопересечения, она умирает.

```
$ ./snake
```

![](Images/Snake.gif) 

-----------------------------------------------------------------------------

<a name="3"></a>
 ## LLVM Pass

> [!NOTE]
> **TracePlugin** - пасс для clang, вставляющий перед каждой инструкцией вызов функции-коллбэка. 
> В нашем случае этот коллбэк собирает трассу исполнения. Затем анализируется частота вместе встречающихся опкодов.

```
$ ./snakePass
```
```
Трасса в файле: Trace.txt
Статистика повторения опкодов для трассы в файле: Statistic.txt
```

На основе файла *Statistic.txt* можно построить графики.


-----------------------------------------------------------------------------


 
 <a name="2"></a>
 ## Сборка 

> [!IMPORTANT]
> Для графического окна нужен интерфейс **SDL2**.

На Linux его можно установить так:
```
$ sudo apt-get install libsdl2-dev
```


Для сборки всего, находясь в корневой директории проекта:
 
```
$ cmake   -B build
$ cd build/
$ make
```

* Программа *snake* будет в *build/lib/GraphicalApp*.
* LLVM IR для *snake* будет в *build/lib/LLVM_IR*.
* Программа *snakePass* будет в *build/lib/LLVM_Pass*.


