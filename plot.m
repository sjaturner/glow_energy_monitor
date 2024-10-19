file=argv(){1};
energy=load(file);
energy=energy(energy(:,1)>1728570000,:);
stairs((energy(:,1)-energy(end,1))/3600/24,energy(:,2));
print(sprintf("%s.png", file));
