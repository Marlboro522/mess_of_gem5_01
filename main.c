#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <m5ops.h>
#include "pq.h"
typedef struct pq pq;

int main(int argc, char *argv[])
{ 
  uint64_t ns_delay=0;
  uint64_t ns_period=0;
  int i;
  const int n = 10;
  double *v = malloc(sizeof(double)*n);
  double **p = malloc(sizeof(double*)*n);
  pq *mypq;

  /* init */
  srand48(time(NULL));
  mypq = pq_create();
  for (i = 0; i < n; i++) {
    v[i] = drand48();
    p[i] = &v[i];
  }

  /* begin sort */
  m5_dump_reset_stats(ns_delay,ns_period);
  for (i = 0; i < n; i++){
    pq_push(mypq, v[i], (void*)p[i]); //v is the priority and teh p is the value
  };
  // for (i = 0; i < n; i++) {
  //   printf("%d\n", i);
  //   if (p[i])
  //     printf("%g\n", *p[i]);
  // }
  for (i = 0; i < n; i++)
    p[i] = pq_pop(mypq);
  /* end sort */
  m5_dump_reset_stats(ns_delay,ns_period);

//  for (i = 0; i < n; i++) {
//    if (p[i])
//      printf("%g\n", *p[i]);
//  }

  pq_destroy(mypq);

  free(v);
  free(p);
  return 0;
}
