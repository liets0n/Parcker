Algoritmo "Parcker"
// Disciplina  : Algoritmo e L�gica de Programa��o(ALP)
// Professor   : Sediangani Daniel N. Sofrimento
// Descri��o   : Software para gerir o park de estacionamento
// Autor       : Lietson Dos Santos
// Data atual  : 11/12/2023
Var
   exit, is_there_slots: logico
   parking_lots: vetor[0..3, 0..7] de inteiro
   temp, option, line, column, place, floor: inteiro
   lines_length, columns_length, random_column, random_line: inteiro
   floor_tmp: caracter
Inicio

   lines_length := 3 // Constante
   columns_length := 7 // Constante

   exit := falso
   is_there_slots := falso

   repita:
      limpatela()

      escreval(" _________________________________________")
      escreval("|                                         |")
      escreval("|        Menu - Selecione uma op��o       |")
      escreval("|_________________________________________|")
      escreval("|   |                                     |")
      escreval("| 1 | Painel de vagas                     |")
      escreval("| 2 | Selecionar uma vaga automaticamente |")
      escreval("| 3 | Selecionar uma vaga manualmente     |")
      escreval("| 4 | Desocupar vaga                      |")
      escreval("| 5 | Sair                                |")
      escreval("|___|_____________________________________|")

      escreval("")
      escreva("> ")
      leia(option)

      escreval("")

      // Op��o 1 - Apresentar o painel de vagas
      se (option = 1) entao

         line := 0
         column := 0

         limpatela()

         escreval("Pisos: A � D")
         escreval("Vagas: 1 � 8")

         escreval(" ______________________________________________")
         escreval("|                                              |")
         escreval("|                      Mapa                    |")
         escreval("|______________________________________________|")
         escreval("|      |                                       |")
         escreval("| PISO |  1 |  2 |  3 |  4 |  5 |  6 |  7 |  8 |")
         escreval("|   A  | A1 | A2 | A3 | A4 | A5 | A6 | A7 | A8 |")
         escreval("|   B  | B1 | B2 | B3 | B4 | B5 | B6 | B7 | B8 |")
         escreval("|   C  | C1 | C2 | C3 | C4 | C5 | C6 | C7 | C8 |")
         escreval("|   D  | D1 | D2 | D3 | D4 | D5 | D6 | D7 | D8 |")
         escreval("|______|_______________________________________|")

         escreval("")

         escreval("Dispon�vel: O")
         escreval("Indispon�vel: X")

         escreval(" _______________________________ ")
         escreval("|                               |")
         escreval("|        Painel de vagas        |")
         escreval("|_______________________________|")
         escreval("|                               |")

         // Percorrer a matriz e preencher com X as
         // vagas indispon�veis e com O as dispon�veis.
         para line de 0 ate lines_length faca
            para column de 0 ate columns_length faca

               // Verifica se a vaga est� dispon�vel
               se parking_lots[line, column] = 0 entao

                  // Se for o primeiro valor da linha exibir� a borda do lado esquerdo
                  se column = 0 entao
                     escreva("| O |")
                  senao
                     escreva(" O |")
                  fimse
               senao

                  // Se for o primeiro valor da linha exibir� a borda do lado esquerdo
                  se column = 0 entao
                     escreva("| X |")
                  senao
                     escreva(" X |")
                  fimse
               fimse
            fimpara

            escreval("")
         fimpara

         escreval(" _______________________________ ")

         escreval("")
         escreva("Pressione enter para retornar ao Menu...")
         leia(temp)

      senao
         // Op��o 2 � Seleccionar uma vaga automaticamente
         se (option = 2) entao

            line := 0
            column := 0
            is_there_slots := falso
            temp := 0

            // Percorre a matriz verificando se h� vagas despon�veis
            para line de 0 ate lines_length faca
               para column de 0 ate columns_length faca

                  // Verifica se a vaga est� ocupada ou n�o
                  se parking_lots[line, column] = 0 entao
                     is_there_slots := verdadeiro
                  fimse
               fimpara
            fimpara

            // Verifica se h� vagas dispon�veis
            se is_there_slots = verdadeiro entao

               // Pegando os n�meros aleat�rios
               random_line := randi(lines_length)
               random_column := randi(columns_length)

               // Verifica se a vaga selecionada alet�riamente est� ocupada
               se parking_lots[random_line, random_column] = 1 entao
                  escreval("Houve um pequeno problema ao selecionar a vaga, Tente novamente!")
               senao
                  // O n�mero 1 representa vaga ocupada
                  parking_lots[random_line, random_column] := 1

                  se (random_line = 0) entao
                     escreval("Selecionou-se a vaga A", random_column + 1)
                  senao
                     se (random_line = 1) entao
                        escreval("Selecionou-se a vaga B", random_column + 1)
                     senao
                        se (random_line = 2) entao
                           escreval("Selecionou-se a vaga C", random_column + 1)
                        senao
                           se (random_line = 3) entao
                              escreval("Selecionou-se a vaga D", random_column + 1)
                           fimse
                        fimse
                     fimse
                  fimse

                  escreval("Vaga selecionada com sucesso!!! :)")
               fimse
            senao
               escreva("N�o h� vaga dispon�vel! :/")
            fimse

            escreval("")
            escreva("Pressione enter para continuar...")
            leia(temp)
         senao
            // Op��o 3 - Seleccionar uma vaga manualmente
            se (option = 3) entao

               line := 0
               column := 0
               is_there_slots := falso

               // Percorre a matriz verificando se h� vagas dispon�veis
               para line de 0 ate lines_length faca
                  para column de 0 ate columns_length faca

                     // Verifica se a vaga est� dispon�vel
                     se parking_lots[line, column] = 0 entao
                        is_there_slots := verdadeiro
                     fimse
                  fimpara
               fimpara

               // Verifica se h� vagas dispon�veis
               se is_there_slots = verdadeiro entao
                  limpatela()

                  escreva("Selecione o piso(A � D): ")
                  leia(floor_tmp)

                  se (floor_tmp = "A") entao
                     floor := 1
                  senao
                     se (floor_tmp = "B") entao
                        floor := 2
                     senao
                        se (floor_tmp = "C") entao
                           floor := 3
                        senao
                           se (floor_tmp = "D") entao
                              floor := 4
                           senao
                              floor := 5
                           fimse
                        fimse
                     fimse
                  fimse

                  escreva("Selecione a vaga(1 � 8): ")
                  leia(place)

                  escreval("")

                  // Verificar se os valores digitados s�o v�lidos
                  se ((floor - 1 <= lines_length) e (floor - 1 >= 0)) entao
                     se ((place - 1 <= columns_length) e (place - 1 >= 0)) entao

                        // Verifica se a vaga est� dispon�vel
                        se parking_lots[floor - 1, place - 1] = 0 entao

                           // Se os valores forem v�lidos a vaga ser� ocupada
                           // O n�mero 1 representa vaga ocupada
                           parking_lots[floor - 1, place - 1] := 1

                           se ((floor - 1) = 0) entao
                              escreval("Selecionou a vaga A", place)
                           senao
                              se ((floor - 1) = 1) entao
                                 escreval("Selecionou a vaga B", place)
                              senao
                                 se ((floor - 1) = 2) entao
                                    escreval("Selecionou a vaga C", place)
                                 senao
                                    se ((floor - 1) = 3) entao
                                       escreval("Selecionou a vaga D", place)
                                    fimse
                                 fimse
                              fimse
                           fimse
                           escreval("Opera��o realizada com sucesso!!! :)")
                        senao
                           escreval("Esta vaga est� indispon�vel! :/")
                        fimse
                     senao
                        escreval("Selecionou uma vaga v�lida! :(")
                     fimse
                  senao
                     escreval("Selecionou um piso v�lido! :(")
                  fimse
               senao
                  escreva("N�o h� vagas dispon�veis! :/")
               fimse

               escreval("")
               escreva("Pressione enter para retornar ao Menu...")
               leia(temp)
            senao
               // Op��o 4 - Desocupar lugar
               se (option = 4) entao
                  limpatela()

                  escreva("Selecione o piso(A � D): ")
                  leia(floor_tmp)

                  se (floor_tmp = "A") entao
                     floor := 1
                  senao
                     se (floor_tmp = "B") entao
                        floor := 2
                     senao
                        se (floor_tmp = "C") entao
                           floor := 3
                        senao
                           se (floor_tmp = "D") entao
                              floor := 4
                           senao
                              floor := 5
                           fimse
                        fimse
                     fimse
                  fimse

                  escreva("Selecione a vaga(1 � 8): ")
                  leia(place)

                  escreval("")

                  // Verificar se os valores digitados s�o v�lidos
                  se (floor - 1 <= lines_length) e (floor - 1 >= 0) entao
                     se (place - 1 <= columns_length) e (place - 1 >= 0) entao

                        // Verificar se a vaga est� dispon�vel
                        se parking_lots[floor - 1, place - 1] = 1 entao

                           // Se estiver indispon�vel a vaga ser� desocupada
                           // O n�mero 0 representa vaga dispon�vel
                           parking_lots[floor - 1, place - 1] := 0

                           se ((floor - 1) = 0) entao
                              escreval("A vaga A", place, " est� novamente dispon�vel!")
                           senao
                              se ((floor - 1) = 1) entao
                                 escreval("A vaga B", place, " est� novamente dispon�vel!")
                              senao
                                 se ((floor - 1) = 2) entao
                                    escreval("A vaga C", place, " est� novamente dispon�vel!")
                                 senao
                                    se ((floor - 1) = 3) entao
                                       escreval("A vaga D", place, " est� novamente dispon�vel!")
                                    fimse
                                 fimse
                              fimse
                           fimse
                           escreval("Opera��o realizada com sucesso! :)")
                        senao
                           escreval("Esta vaga est� dispon�vel! :/")
                        fimse
                     senao
                        escreval("Selecione uma vaga v�lida! :(")
                     fimse
                  senao
                     escreval("Selecione um piso v�lido! :(")
                  fimse

                  escreval("")
                  escreva("Pressione enter para retornar ao Menu...")
                  leia(temp)
               senao
                  // Op��o 5 - Sair da aplica��o
                  se (option = 5) entao
                     exit := verdadeiro
                  senao
                     escreva("Op��o inv�lida")
                  fimse
               fimse
            fimse
         fimse
      fimse
   ate exit = verdadeiro

   escreval("")

Fimalgoritmo