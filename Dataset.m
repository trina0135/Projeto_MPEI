dataset = 'Reviews.csv';
data_demasiado_grande = readtable(dataset, 'Delimiter', ',', 'TextType', 'string');
disp(data_demasiado_grande(1:5,:));

data = data_demasiado_grande(:, ["ProductId", "UserId", "Score"]);

disp(data(1:5,:));

avaliacoes = data_demasiado_grande.("Summary");
disp(avaliacoes(1));

Retirar_virgulas_e_assim= regexprep(feedbacks, '[^\w\s]', '');
minusculo= lower(Retirar_virgulas_e_assim);
palavras_irrelevantes= ["a", "an", "the", "and", "but", "or", "in", "on", "with", "at", "for", "by","it","this"];

palavras=split(join(minusculo));
palavras= palavras(~ismember(palavras, palavras_irrelevantes));
palavras_unicas=unique(palavras);
writetable(data, 'dataset_util.csv');

numero_de_palavras = countcats(categorical(palavras));
[numeros_organizados, indices_organizados] = sort(numero_de_palavras, 'descend');
palavras_organizadas = palavras_unicas(indices_organizados);




disp(table(palavras_organizadas(1:10), numeros_organizados(1:10), 'VariableNames', {'Palavra', 'Contagem'}));