/// scr_change_music_volume(volume);

vol = argument[0]

audio_sound_gain(snd_menu, vol, 0);
audio_sound_gain(snd_play, vol, 0);
audio_sound_gain(snd_win, vol, 0);
