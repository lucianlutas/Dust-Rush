/// scr_change_sfx_volume(volume);

vol = argument[0]

audio_sound_gain(snd_laser, vol, 0);
audio_sound_gain(snd_explosion, vol, 0);
audio_sound_gain(snd_construction, vol, 0);
audio_sound_gain(snd_complete, vol, 0);
audio_sound_gain(snd_station_sel, vol*0.1, 0);
