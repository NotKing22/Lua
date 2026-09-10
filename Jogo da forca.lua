
Secret_word = "banana"
User_word = {}
Used_letters = {}
Hearts = 6

for i = 1, #Secret_word do
    User_word[i] = "_"
end

function tryLetter(letter)
    for i = 1, #Secret_word do
        if string.sub(Secret_word, i, i) == letter then
            User_word[i] = letter
        end
    end
end

function alreadyUsedLetter(letter)
    for i = 1, #Used_letters do
        if Used_letters[i] == letter then
            print("Você já tentou essa letra!")
            return true
        end
    end
    return false
end

print("BEM VINDO AO JOGO DA FORCA!")

while Hearts > 0 do
    print("\nVIDAS RESTANTES:", Hearts)
    print("PISTA:", table.concat(User_word, " "))
    print("Digite uma letra:")

    user_letter = io.read()
    user_letter = string.lower(user_letter)

    if #user_letter > 1 then
        print("Erro! Digite apenas uma letra.")
        Hearts = Hearts - 1
    elseif #user_letter == 0 then
        print("Erro! Digite uma letra.")
        Hearts = Hearts - 1
    elseif alreadyUsedLetter(user_letter) then
    else
        local acertou = false
        for i = 1, #Secret_word do
            if string.sub(Secret_word, i, i) == user_letter then
                acertou = true
            end
        end
        table.insert(Used_letters, user_letter)
        if acertou then
            tryLetter(user_letter)
            print("Correto!")
        else
            Hearts = Hearts - 1
            print("Errado!")
        end
    end
    if table.concat(User_word) == Secret_word then
        print("\nParabéns! Você acertou a palavra!")
        print("A palavra era:", Secret_word)
        break
    end
end

if Hearts == 0 then
    print("\nVocê perdeu!")
    print("A palavra era:", Secret_word)
end

