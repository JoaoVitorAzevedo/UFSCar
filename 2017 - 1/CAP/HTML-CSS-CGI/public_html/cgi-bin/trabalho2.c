#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int main() {


  char   *pData = NULL;

  FILE  *pScore  = fopen("../score.txt", "r");
  int score =  0;
  if(pScore == NULL){
    // Deu tudo errado e nothing happen

  }
     // else
        //  tudo ok

 fscanf(pScore,"%d", &score);
 fclose(pScore);





  //char* pData = NULL;
  char response[512] = {'\n'};
  int x;
  int resp = 0;
 char rodapeImg[512] = "\n";
 strcpy(rodapeImg, "<img src=\"../ibagem.jpg\" alt=\"Computer Man\" style=\"width:128px; height:128px;\">");
  pData = getenv("QUERY_STRING");
  if (pData == NULL) {

    snprintf(response, sizeof response, "Error parsing the data.\n");
  } else if (sscanf(pData,
                    "x=%d",
                    &x) != 1) {

    snprintf(response, sizeof response, "Isso ai nao eh numero valido nao.\n");
  } else  if(x != 2){
            resp = 0;
                                }
    else{
            resp = 1;





}


pScore = fopen("../score.txt", "w");


  printf("%s%c%c\n","Content-Type:text/html;charset=UTF-8",13,10);

  printf("<!DOCTYPE html>");

  printf("<html lang=\"en\">");

  printf("<head>");


          //printf("<meta charset=\"utf-8\">");
          printf("<title>Quem Sou  Eu?</title>");
          printf("<link href=\"../MyPageCss.css\" rel=\"stylesheet\" type=\"text/css\" />");

  printf("</head>");

  printf("<body>");

  printf("<!-- page content -->");

	printf("<div id=\"cabecalho\"><img src=\"../quemsoueu.png\" align=\"center\" width=\"20%\" height=\"20%\" alt=\"Quem sou eu?\"/></div>");
	printf("<div id=\"conteudo\">");
	printf("<div id=\"esquerda\">");
            printf("<div> <span lang=\"en\"> W3schools </span> </div>");
		printf("<div> Restart </div>");
		printf("<div> Contate-nos </div>");
printf("</div>");

printf("<div  id=\"direita\">");

    if(resp==0){
       printf("<img src=\"../images/errou2.png\" width=\"50%\" height=\"50%\"/>");
       printf("<br />");
       printf("<img src=\"../images/errou.png\" width=\"50%\" height=\"50%\"/>");
       fprintf(pScore,"%d", score);

    }
    if(resp==1){
            score++;
            fprintf(pScore,"%d",score);
       printf("<img src=\"../images/acert.png\" width=\"50%\" height=\"50%\" />");
       printf("<br />");
       printf("<img src=\"../images/verygood.gif\" width=\"50%\" height=\"50%\"/>");

    }
    fclose(pScore);

    printf("<br />");
	printf("<a href=\"http://cap.dc.ufscar.br/~743554/trabalho3.html\"/> <img src=\"../images/button_next.png\" width=\"20%\" heigth=\"20%\"/>");
	printf("<br />");



     printf("%s", response);
// printf("<img src=\"calclove.jpg"\ alt=\"HTML5 Icon\" width=/"128/" height=/"128/">");
//printf("%s", rodapeImg);
//printf("<h3> cade a imagem </h3>");


	printf("</div>");
printf("<div id=\"rodape\"><a href=\"https://www.facebook.com/joaovitor.azevedo.90\"><img src=\"../images/an.gif\"> </a></div>");
printf("</div>");





  printf("</body>");

  printf("</html>");

  return 0;
}
