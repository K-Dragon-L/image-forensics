function save_imagesc(map, path, extension)
    figure;
    imagesc(map);
    set(gca, 'XTick', []);
    set(gca, 'YTick', []);
    set(gca, 'Position', [0 0 1 1]);
    saveas(gcf, path, extension);
end