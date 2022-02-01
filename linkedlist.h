#include <stdlib.h>
#include <string.h>
typedef enum {FON_ID=0,VAR_ID=1} Type_ID; 
typedef struct Node {
	int scope;
	char name[50];
	Type_ID type;
	struct Node* next;
}Node;

Node* Top = NULL;



void PrintNode(){
	Node* i;
	for(i = Top;i != NULL ; i = i->next){
		printf("(%s,%d)-" ,i->name,i->scope);
	}
}

Node* AddNode(const char* NodeName,Type_ID NodeType,int NodeScope){
	printf("\n");
	Node* newNode = (Node*)malloc(sizeof(Node));
	strcpy(newNode->name,NodeName);
	newNode->type=NodeType;
	newNode->scope=NodeScope;
	newNode->next = Top;
	Top = newNode;
	PrintNode(); ///
	return newNode;
}	
void DelNode(int NodeScope){ // supprimer variable m scop
	Node* i=Top;
	Node* prev = NULL;
	while(i != NULL && i->scope == NodeScope)
    {
        Top = i->next; // Changed head
        free(i);
		i=Top;
    }

	for(;i != NULL ; i = i->next){
		if(i->scope == NodeScope){
			prev->next = i->next;
			free(i);
			i=prev;
			}
	       prev = i;
	}
}

Node* SearchForNode(char* NodeName){
	Node* i ;
	for(i = Top;i != NULL ; i = i->next){
		if(!strcmp(i->name,NodeName))
			return i;
	}
	return NULL;
}

     