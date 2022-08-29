#include <bits/stdc++.h>
#include <stdlib.h> 
using namespace std;

  
#define BEAD(i, j) beads[i * max + j]

void beadSort(int *a, int len)

{

    int max = a[0];

    for (int i = 1; i < len; i++)

        if (a[i] > max)

           max = a[i];

  

    unsigned char beads[max*len];

    memset(beads, 0, sizeof(beads));

  

    for (int i = 0; i < len; i++)

        for (int j = 0; j < a[i]; j++)

            BEAD(i, j) = 1;

  

    for (int j = 0; j < max; j++)

    {


        int sum = 0;

        for (int i=0; i < len; i++)

        {

            sum += BEAD(i, j);

            BEAD(i, j) = 0;

        }

  


        for (int i = len - sum; i < len; i++)

            BEAD(i, j) = 1;

    }

  


    for (int i = 0; i < len; i++)

    {

        int j;

        for (j = 0; j < max && BEAD(i, j); j++);

  

        a[i] = j;

    }

}

  

int main()

{

    int a[10000000];
    
    int len = sizeof(a)/sizeof(a[0]);

    for (int i = 0; i < len; i++){
        a[i] = rand() %1000;
    }


    beadSort(a, len);

    return 0;

}