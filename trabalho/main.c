#include <stdio.h>
#include <stddef.h>

extern size_t strlen(const char *s);
extern char*  strcpy(char *dest, const char *src);
extern int    strcmp(const char *s1, const char *s2);
extern char*  strcat(char *dest, const char *src);
extern int    strncmp(const char *s1, const char *s2, size_t n);

int main() {
    //teste strlen
    printf("--- teste strlen ---\n");
    const char *s1 = "oi eu sou yuri";
    const char *s2 = "";
    printf("strlen(\"%s\") = %zu\n", s1, strlen(s1));
    printf("strlen(\"%s\") = %zu\n", s2, strlen(s2));
    printf("\n");

    //teste strcpy
    printf("--- teste strcpy ---\n");
    char dest_copy[50];
    strcpy(dest_copy, s1);
    printf("Copiando \"%s\" para dest_copy.\n", s1);
    printf("Resultado: \"%s\"\n", dest_copy);
    printf("\n");

    //teste strcmp
    printf("--- teste strcmp ---\n");
    const char *cmp1 = "OLA";
    const char *cmp2 = "OLA";
    const char *cmp3 = "OLAA";
    const char *cmp4 = "OL";
    printf("strcmp(\"%s\", \"%s\") = %d\n", cmp1, cmp2, strcmp(cmp1, cmp2)); // Esperado: 0
    printf("strcmp(\"%s\", \"%s\") = %d\n", cmp1, cmp3, strcmp(cmp1, cmp3)); // Esperado: < 0
    printf("strcmp(\"%s\", \"%s\") = %d\n", cmp3, cmp1, strcmp(cmp3, cmp1)); // Esperado: > 0
    printf("strcmp(\"%s\", \"%s\") = %d\n", cmp1, cmp4, strcmp(cmp1, cmp4)); // Esperado: > 0
    printf("\n");

    //teste strcat
    printf("--- teste strcat ---\n");
    char dest_cat[50] = "ola, ";
    const char *src_cat = "tudo bem?";
    printf("Concatenando \"%s\" com \"%s\"\n", dest_cat, src_cat);
    strcat(dest_cat, src_cat);
    printf("Resultado: \"%s\"\n", dest_cat);
    printf("\n");

    //teste strncmp
    printf("--- teste strncmp ---\n");
    const char *ncmp1 = "testando";
    const char *ncmp2 = "testador";
    printf("strncmp(\"%s\", \"%s\", 4) = %d\n", ncmp1, ncmp2, strncmp(ncmp1, ncmp2, 4)); // Esperado: 0
    printf("strncmp(\"%s\", \"%s\", 8) = %d\n", ncmp1, ncmp2, strncmp(ncmp1, ncmp2, 8)); // Esperado: > 0
    printf("strncmp(\"%s\", \"%s\", 8) = %d\n", ncmp2, ncmp1, strncmp(ncmp2, ncmp1, 8)); // Esperado: < 0
    printf("strncmp(\"%s\", \"%s\", 0) = %d\n", ncmp1, ncmp2, strncmp(ncmp1, ncmp2, 0)); // Esperado: 0
    printf("\n");

    return 0;
}