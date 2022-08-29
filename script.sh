#!/bin/bash

flags=(O0 O1 O2 O3 O4 Os Ofast)

ml icc                                                                                                                                                                                                             

echo "Compilation with O0 flag"
file="Compil_With_Flag_O0"
g++ -O0 yermolenko.cpp -o $file -lm
time ./$file
echo -e "\n"

echo "Compilation with O1 flag"
file="Compil_With_Flag_O1"
g++ -O1 yermolenko.cpp -o $file -lm
time ./$file
echo -e "\n"

echo "Compilation with O2 flag"
file="Compil_With_Flag_O2"
g++ -O2 yermolenko.cpp -o $file -lm
time ./$file
echo -e "\n"

echo "Compilation with O3 flag"
file="Compil_With_Flag_O3"
g++ -O3 yermolenko.cpp -o $file -lm
time ./$file
echo -e "\n"

echo "Compilation with O4 flag"
file="Compil_With_Flag_O4"
g++ -O4 yermolenko.cpp -o $file -lm
time ./$file
echo -e "\n"

echo "Compilation with Os flag"
file="Compil_With_Flag_Os"
g++ -Os yermolenko.cpp -o $file -lm
time ./$file
echo -e "\n"

echo "Compilation with Ofast flag"
file="Compil_With_Flag_Ofast"
g++ -Ofast yermolenko.cpp -o $file -lm
time ./$file
echo -e "\n"                                                                                                                                                                                                               
                                                                                                                                                                                                                   
grep 'flags' /proc/cpuinfo | uniq
echo -e "\n"
extensions=(sse2 ssse3 sse4.2 avx)

for ext in ${extensions[@]}
do
        file="iccCompil_Flag_$ext"
        icc -std=c++11 -x$ext -O2 yermolenko.cpp -o $file
        if [ $? -eq 0 ]
        then
        echo "Compilation with $ext processor extension"
        time ./$file
        echo -e "\n"
        fi
done