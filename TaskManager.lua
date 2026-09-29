tarefas = {}

function adicionarTarefa()
    print("\n[ TAREFA ]")
    io.write("Digite a tarefa: ")
    nome = io.read()

    if nome == "" then
        print("A tarefa não pode estar vazia.")
        return
    end

    tabela = {
        nome = nome,
        concluida = false
    }

    table.insert(tarefas, tabela)

    print("Tarefa adicionada com sucesso!")
end

function listarTarefas()
    print("\n[ TAREFAS ]")

    if #tarefas == 0 then
        print("Nenhuma tarefa cadastrada.")
        return
    end

    for i = 1, #tarefas do
        tarefa = tarefas[i]

        if tarefa.concluida then
            print(i .. " - [X] " .. tarefa.nome)
        else
            print(i .. " - [ ] " .. tarefa.nome)
        end
    end
end

function concluirTarefa()
    listarTarefas()

    if #tarefas == 0 then
        return
    end

    io.write("\nDigite o numero da tarefa: ")
    numero = tonumber(io.read())

    if numero == nil or tarefas[numero] == nil then
        print("Tarefa invalida.")
        return
    end

    tarefas[numero].concluida = true

    print("Tarefa concluida!")
end

function removerTarefa()
    listarTarefas()

    if #tarefas == 0 then
        return
    end

    io.write("\nDigite o numero da tarefa: ")
    numero = tonumber(io.read())

    if numero == nil or tarefas[numero] == nil then
        print("Tarefa invalida.")
        return
    end

    table.remove(tarefas, numero)

    print("Tarefa removida!")
end

function salvarTarefas()
    arquivo = io.open("tarefas.txt", "w")

    if arquivo == nil then
        print("Nao foi possivel salvar as tarefas.")
        return
    end

    for i = 1, #tarefas do
        tarefa = tarefas[i]

        if tarefa.concluida then
            arquivo:write("1|" .. tarefa.nome .. "\n")
        else
            arquivo:write("0|" .. tarefa.nome .. "\n")
        end
    end

    arquivo:close()
end

function carregarTarefas()
    arquivo = io.open("tarefas.txt", "r")

    if arquivo == nil then
        return
    end

    for linha in arquivo:lines() do
        concluida, nome = linha:match("^(%d)|(.*)$")

        if nome ~= nil then
            tabela = {
                nome = nome,
                concluida = concluida == "1"
            }

            table.insert(tarefas, tabela)
        end
    end

    arquivo:close()
end

function menu()
    while true do
        print("\n======================")
        print("      TASK MANAGER")
        print("======================")
        print("1 - Adicionar tarefa")
        print("2 - Listar tarefas")
        print("3 - Concluir tarefa")
        print("4 - Remover tarefa")
        print("5 - Salvar tarefas")
        print("0 - Sair")
        print("======================")

        io.write("Escolha uma opcao: ")
        opcao = tonumber(io.read())

        if opcao == 1 then
            adicionarTarefa()
        elseif opcao == 2 then
            listarTarefas()
        elseif opcao == 3 then
            concluirTarefa()
        elseif opcao == 4 then
            removerTarefa()
        elseif opcao == 5 then
            salvarTarefas()
            print("Tarefas salvas!")
        elseif opcao == 0 then
            salvarTarefas()
            print("Programa encerrado.")
            break
        else
            print("Opcao invalida.")
        end
    end
end

carregarTarefas()
menu()