function ind = ktory_war(EEG, warun)

% funkcja pomoga sprawdzać na straym matlabie
% które epoki należą do których warunków
% eksperymentalnych
% 
% ind = ktory_war(EEG, 'face_0');
%
% ind = ktory_war(EEG, {'face_0', 'face_180'})


[cent, whichcent, names] = ...
	epoch_centering_events(EEG);

self.names = names;
self.name2epoch = cent;
self.which_centering = whichcent;
        
if ~iscell(warun)
	warun = {warun};
end
if size(warun, 1) > size(warun, 2)
	warun = warun';
end

ind = [];
for n = warun
    which_name = find(strcmpi(n{1}, names));
    if ~isempty(which_name)
        ind = unique([ind, find(cent ...
        	(which_name, :))]);
    end
end
