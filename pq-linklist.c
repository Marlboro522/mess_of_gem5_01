#include <stdio.h>
#include <stdlib.h>
typedef struct pq_node {
    double priority;
    void *data;
    struct pq_node *next;
} pq_node;

typedef struct {
    pq_node *head;
} linked_list_pq;

linked_list_pq *pq_create() {
    linked_list_pq *pq = (linked_list_pq *)malloc(sizeof(linked_list_pq));
    pq->head = NULL;
    return pq;
}

void pq_push(linked_list_pq *pq, double priority, void *data) {
    pq_node *new_node = (pq_node *)malloc(sizeof(pq_node));
    new_node->priority = priority;
    new_node->data = data;
    new_node->next = NULL;

    if (pq->head == NULL || priority < pq->head->priority) {
        new_node->next = pq->head;
        pq->head = new_node;
    } else {
        pq_node *current = pq->head;
        while (current->next != NULL && priority >= current->next->priority) {
            current = current->next;
        }
        new_node->next = current->next;
        current->next = new_node;
    }
}

void *pq_pop(linked_list_pq *pq) {
    pq_node *temp = pq->head;
    void *data = temp->data;
    pq->head = pq->head->next;
    free(temp);
    return data;
}

void pq_destroy(linked_list_pq *pq) {
    // pq_node *current = pq->head;
    // while (current != NULL) {
    //     pq_node *temp = current;
    //     current = current->next;
    //     free(temp);
    // }
    free(pq->head);
}
