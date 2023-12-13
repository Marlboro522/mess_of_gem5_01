#include <stdio.h>
#include <stdlib.h>
// #include "pq.h"

typedef struct {
    double priority;
    void *data;
} pq_node;

typedef struct {
    pq_node *heap;
    int size;
    int capacity;
} min_heap;

min_heap *pq_create(int capacity) {
    min_heap *pq = (min_heap *)malloc(sizeof(min_heap));
    pq->capacity = capacity;
    pq->size = 0;
    pq->heap = (pq_node *)malloc(capacity * sizeof(pq_node));
    return pq;
}

void pq_swap(pq_node *a, pq_node *b) {
    pq_node temp = *a;
    *a = *b;
    *b = temp;
}

void pq_push(min_heap *pq, double priority, void *data) {
    if (pq->size >= pq->capacity) {
        return;
    }
    int index = pq->size++;
    pq->heap[index].priority = priority;
    pq->heap[index].data = data;
    //Just the parent woud be sufficient here...

    while (index > 0) {
        int parent = (index - 1) / 2;
        if (pq->heap[parent].priority <= pq->heap[index].priority) {
            break;
        }
        pq_swap(&pq->heap[parent], &pq->heap[index]);
        index = parent;
    }
}

void *pq_pop(min_heap *pq) {
    pq_node *min_node = &pq->heap[0];
    pq_node *last_node = &pq->heap[--pq->size];
    int index = 0;
    //rearrangement of the priority queue
    //you need to be careful and test the indexing equations you got here

    while (1) {
        int left_child = 2 * index + 1;
        int right_child = 2 * index + 2;
        if (left_child >= pq->size) {
            break;
        }
        int smaller_child = left_child;
        if (right_child < pq->size && pq->heap[right_child].priority < pq->heap[left_child].priority) {
            smaller_child = right_child;
        }
        if (pq->heap[smaller_child].priority >= last_node->priority) {
            break;
        }
        pq->heap[index] = pq->heap[smaller_child];
        index = smaller_child;
    }

    pq->heap[index] = *last_node;
    return min_node->data;
}

void pq_destroy(min_heap *pq) {
    free(pq->heap);
    free(pq);
}
