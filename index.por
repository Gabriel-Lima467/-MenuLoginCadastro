programa {

   inclua biblioteca Texto --> tx

   // --- VARIÁVEIS GLOBAIS ---
   cadeia usuarios[10], senhas[10], datasNasc[10], cpfs[10], numcels[10]
   inteiro qtdCadastro = 0

   funcao inicio() {
      escreva("Bem-vindo ao Devflix!\n\n")
      menu()
   }

   funcao menu() {
      inteiro opcao

      escreva("----- MENU DEVFLIX -----\n\n")
      escreva("1 - CRIAR CADASTRO\n")
      escreva("2 - LOGIN\n")
      escreva("3 - SAIR\n")
      escreva("Escolha uma opcao: ")
      leia(opcao)

      se (opcao == 1) {
         criarCadastro()
      }
      senao se (opcao == 2) {
         login()
      }
      senao se (opcao == 3) {
         escreva("Saindo do sistema...\n")
      }
      senao {
         escreva("Opcao invalida! Tente novamente.\n\n")
         menu()
      }
   }

   funcao criarCadastro() {
      inteiro i, erroCPF
      logico temNumero, temEspecial, erroCPF, valido
      cadeia numero_caracteres

      valido = falso
      temNumero = falso
      temEspecial = falso
      erroCPF = falso

      se (qtdCadastro >= 10) {
         escreva("Limite de cadastros atingido.\n")
         menu()
      }

      escreva("\n===== CRIAR CADASTRO =====\n")

      faca {
         escreva("Digite nome e sobrenome: ")
         leia(usuarios[qtdCadastro])

         para (i = 0; i < tx.numero_caracteres(usuarios[qtdCadastro]); i++) {
            caracter c = tx.obter_caracter(usuarios[qtdCadastro], i)

            se (c < '0' ou c > '9' e c < 'A' e c > 'Z' e c < 'a' e c > 'z' e c != ' ') {
               valido = verdadeiro
            }
            senao {
               valido == falso
            }
         }

         se (valido == falso) {
            escreva("Nome inválido! Digite apenas letras.\n")
            // aqui você pode pedir de novo chamando a função de cadastro
         }

      } enquanto (valido == falso)

      escreva("Digite data de nascimento: ")
      leia(datasNasc[qtdCadastro])

      escreva("Digite numero de celular: ")
      leia(numcels[qtdCadastro])

      // --- Validação da senha com faca-enquanto ---
      faca {
         escreva("Digite CPF: ")
         leia(cpfs[qtdCadastro])

         se (tx.numero_caracteres(cpfs[qtdCadastro]) != 11) {
            escreva("Cpf inválido! Precisa ter pelo menos 11 caracteres.\n")
            erroCPF = falso
            menu()
         }
         senao {
            erroCPF == verdadeiro
         }

         // validação senha
         escreva("Digite uma senha: ")
         leia(senhas[qtdCadastro])

         // verifica se tem pelo menos 6 caracteres
         se (tx.numero_caracteres(senhas[qtdCadastro]) < 6) {
            escreva("Senha inválida! Precisa ter pelo menos 6 caracteres.\n")
            temNumero = falso
         }
         senao {
            // verifica se tem pelo menos um número
            temNumero = falso
            para (i = 0; i < tx.numero_caracteres(senhas[qtdCadastro]); i++) {
               caracter c = tx.obter_caracter(senhas[qtdCadastro], i)

               se (c >= '0' e c <= '9') {
                  temNumero = verdadeiro
               }
               senao se ((c < '0') ou (c > '9' e c < 'A') ou (c > 'Z' e c < 'a') ou (c > 'z')) {
                  temEspecial = verdadeiro
               }

               se (temEspecial == verdadeiro e temNumero == verdadeiro) {
                  pare
               }
            }

            se (temNumero == falso) {
               escreva("Senha inválida! Precisa conter pelo menos um número.\n")
            }
         }

      } enquanto (tx.numero_caracteres(senhas[qtdCadastro]) < 6 
               e temNumero == falso 
               e temEspecial == falso 
               e erroCPF == falso)

      // --- Cadastro concluído ---
      escreva("\nCadastro concluido com sucesso!\n")
      escreva("Bem-vindo ao Devflix, ", usuarios[qtdCadastro], "!\n\n")

      qtdCadastro = qtdCadastro + 1
      menu()
   }

   funcao login() {
      cadeia usuarioDigitado, senhaDigitada
      inteiro i
      logico encontrado = falso
      cadeia usuario
      cadeia nome[4], senha[4]
      inteiro cpf[4], numcel[4]

      // ---- DADOS FIXOS ----
      nome[0] = "Gabriel Santos"
      nome[1] = "Gabriel Torres"
      nome[2] = "Rafael Rezende"
      nome[3] = "Ricardo Luiz"

      senha[0] = "asda!34fa"
      senha[1] = "akda#0f5"
      senha[2] = "awet01@f"
      senha[3] = "afh78!b#"

      cpf[0] = 12256448976
      cpf[1] = 13456478970
      cpf[2] = 13352417978
      cpf[3] = 24356748086

      numcel[0] = 991876543
      numcel[1] = 991473244
      numcel[2] = 912876587
      numcel[3] = 994536219

      escreva("\n===== LOGIN =====\n")
      escreva("Digite o CPF: ")
      leia(usuarioDigitado)
      escreva("\n")
      escreva("Digite a senha: ")
      leia(senhaDigitada)

      // Procurar nos cadastros
      para (i = 0; i < qtdCadastro; i++) {
         se (usuarioDigitado == cpfs[i] e senhaDigitada == senhas[i]) {
            escreva("Olá ", usuarios[i], "!\n\n")
            encontrado = verdadeiro
            pare
         }
      }
         se (encontrado == falso) {
            para (i = 0; i < 4; i++) {
               se (usuarioDigitado == cpf[i] e senhaDigitada == senha[i]) {
                  escreva("Olá ", nome[i], "!\n\n")
                  encontrado = verdadeiro
                  pare
               }
            }
         }
      

      se (encontrado == falso) {
         escreva("Usuário ou senha inválidos.\n\n")
      }
   }
}
