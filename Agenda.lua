```lua
local contatos = {
    {
        nome = "João Silva",
        telefone = "99999-1111"
    },
    {
        nome = "Maria Oliveira",
        telefone = "98888-2222"
    },
    {
        nome = "Pedro Santos",
        telefone = "97777-3333"
    },
    {
        nome = "Ana Costa",
        telefone = "96666-4444"
    },
    {
        nome = "Lucas Ferreira",
        telefone = "95555-5555"
    },
    {
        nome = "Juliana Souza",
        telefone = "94444-6666"
    },
    {
        nome = "Carlos Lima",
        telefone = "93333-7777"
    },
    {
        nome = "Fernanda Rocha",
        telefone = "92222-8888"
    },
    {
        nome = "Gabriel Almeida",
        telefone = "91111-9999"
    },
    {
        nome = "Beatriz Martins",
        telefone = "90000-0000"
    }
}

function adicionar_contato(nome, telefone)
    table.insert(contatos, {
        nome = nome,
        telefone = telefone
    })
end

function contato_existe(telefone)
    for i = 1, #contatos do
        if contatos[i].telefone == telefone then
            return true
        end
    end

    return false
end

local option = 0
local running = true

while running do
    print("[-=-=-=-=[BEM-VINDO a sua agenda telefonica]-=-=-=-=]")
    print("(1) - Ver contatos")
    print("(2) - Adicionar contatos")
    print("(3) - Remover contatos")
    print("(4) - Editar contatos")
    print("(5) - Limpar contatos")
    print("(6) - Sair")

    option = tonumber(io.read())

    if option == nil then
        print("\n[AGENDA] Informe um valor válido.\n")

    elseif option == 1 then
        for i = 1, #contatos do
            print("[" .. i .. "] - nome: [" .. contatos[i].nome .. "] telefone: [" .. contatos[i].telefone .. "]")
        end

        print("[AGENDA] Total de usuários cadastrados: " .. #contatos)

    elseif option == 2 then
        print("[AGENDA] Informe o nome do usuario: ")
        local nome = io.read()

        print("[AGENDA] Informe o numero de telefone: ")
        local telefone = io.read()

        if nome == "" or telefone == "" then
            print("\n[AGENDA] Nome e telefone não podem ficar vazios.\n")

        elseif not contato_existe(telefone) then
            adicionar_contato(nome, telefone)
            print("\n[AGENDA] Contato adicionado a agenda.\n")

        else
            print("\n[AGENDA] Este telefone já existe na agenda.\n")
        end

    elseif option == 3 then
        print("[AGENDA] Informe o telefone que deseja apagar da agenda:")
        local telefone = io.read()

        local encontrado = false

        for i = 1, #contatos do
            if contatos[i].telefone == telefone then
                table.remove(contatos, i)

                print("\n[AGENDA] Número removido da agenda.\n")

                encontrado = true
                break
            end
        end

        if not encontrado then
            print("\n[AGENDA] Número não encontrado.\n")
        end

    elseif option == 4 then
        print("[AGENDA] Informe o telefone do contato que deseja editar:")
        local telefone = io.read()

        local encontrado = false

        for i = 1, #contatos do
            if contatos[i].telefone == telefone then
                print("[AGENDA] Informe o novo nome:")
                local novo_nome = io.read()

                print("[AGENDA] Informe o novo telefone:")
                local novo_telefone = io.read()

                if novo_nome == "" or novo_telefone == "" then
                    print("\n[AGENDA] Nome e telefone não podem ficar vazios.\n")

                elseif novo_telefone ~= telefone and contato_existe(novo_telefone) then
                    print("\n[AGENDA] Este telefone já existe na agenda.\n")

                else
                    contatos[i].nome = novo_nome
                    contatos[i].telefone = novo_telefone

                    print("\n[AGENDA] Contato editado com sucesso.\n")
                end

                encontrado = true
                break
            end
        end

        if not encontrado then
            print("\n[AGENDA] Número não encontrado.\n")
        end

    elseif option == 5 then
        contatos = {}

        print("\n[AGENDA] Todos os contatos foram removidos.\n")

    elseif option == 6 then
        running = false

        print("\n[AGENDA] Programa encerrado.\n")

    else
        print("\n[AGENDA] Opção inválida.\n")
    end
end
```
