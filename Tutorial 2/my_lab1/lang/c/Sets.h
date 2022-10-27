#ifndef _Sets_h
#define _Sets_h

#include <stdint.h>
#include <stdbool.h>
#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* TODO : #define Sets__PEOPLE__max */
/* Clause SETS */
typedef int Sets__PEOPLE;
typedef enum
{
    Sets__yes,
    Sets__no
    
} Sets__ANSWER;
#define Sets__ANSWER__max 2
typedef enum
{
    Sets__Up_Key,
    Sets__Down_Key,
    Sets__Left_Key,
    Sets__Right_Key
    
} Sets__CURSOR_KEY;
#define Sets__CURSOR_KEY__max 4
typedef enum
{
    Sets__North,
    Sets__South,
    Sets__East,
    Sets__West
    
} Sets__DIRECTION;
#define Sets__DIRECTION__max 4

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* TO DO: #define Sets__Jim */
/* TO DO: #define Sets__Sue */
/* Array and record constants */



/* Clause CONCRETE_VARIABLES */

extern void Sets__INITIALISATION(void);


#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Sets_h */
