function WILD_genIntanHeader(filename)
% save_Intan_RHD2000_file
% Writes data into an Intan-compatible RHD2000 format file.
%
% Arguments:
% - filename: Path to the output .rhd file.
% - data_struct: Struct containing all necessary data and metadata.
if nargin<1
    [f,p]= uigetfile('CE_params.bin');
    filename=[p,f];
end
[sysParam,dsp]=WILD_ReadHeader(filename);
filename_output = strrep(filename,'CE_params.bin','info.rhd');
fid = fopen(filename_output, 'w');
if fid == -1
    error('Failed to open file for writing.');
end

% Write magic number
fwrite(fid, hex2dec('c6912702'), 'uint32');

% Write version number
fwrite(fid, 0, 'int16');
fwrite(fid, 0 , 'int16');

% Write frequency parameters
fwrite(fid, sysParam.fs, 'single');
fwrite(fid, sysParam.cl_mode , 'int16');
fwrite(fid, sysParam.fs/2, 'single');
fwrite(fid, 0.1, 'single');
fwrite(fid, sysParam.fs/2, 'single');
fwrite(fid, sysParam.fs/2, 'single');
fwrite(fid, 0.1, 'single');
fwrite(fid, sysParam.fs/2, 'single');

% Write notch filter settings
fwrite(fid, 0, 'int16');
fwrite(fid, 1000, 'single');
fwrite(fid, 1000, 'single');

% Write notes
write_QString(fid, []);
write_QString(fid, []);
write_QString(fid, []);

% Write number of temperature sensors
% fwrite(fid, 0, 'int16');

% Write board mode
% fwrite(fid, 0, 'int16');

% Write reference channel
% if isfield(data_struct, 'reference_channel')
%     write_QString(fid, 0);
% end

% Write signal group information
number_of_signal_groups = 2;
fwrite(fid, number_of_signal_groups, 'int16');
%amplifier group
write_QString(fid, 'Port A');
write_QString(fid, 'A');
fwrite(fid, 1, 'int16');
fwrite(fid, sysParam.Nch, 'int16');
fwrite(fid, sysParam.Nch, 'int16');

for channel = 1:sysParam.Nch
    write_QString(fid, sprintf('A-%03d',(channel-1)));
    write_QString(fid, sprintf('A-%03d',(channel-1)));
    fwrite(fid, channel, 'int16');
    fwrite(fid, channel, 'int16');
    fwrite(fid, 0, 'int16'); %signal_type
    fwrite(fid, 1, 'int16');
    fwrite(fid, channel, 'int16');
    fwrite(fid, 1, 'int16');
    fwrite(fid, 0, 'int16');
    fwrite(fid, 0, 'int16');
    fwrite(fid, 0, 'int16');
    fwrite(fid, 0, 'int16');
    fwrite(fid, 0, 'single');
    fwrite(fid, 0, 'single');
end
%analogin group
N_aux = sysParam.Nch/4;
write_QString(fid, 'ADC');
write_QString(fid, 'ADC');
fwrite(fid, 1, 'int16');%enabled
fwrite(fid, N_aux, 'int16');
fwrite(fid, N_aux, 'int16');

for channel = 1:N_aux
    write_QString(fid, ['CH',num2str(channel-1)]);
    write_QString(fid, ['CH',num2str(channel-1)]);
    fwrite(fid, channel, 'int16');
    fwrite(fid, channel, 'int16');
    fwrite(fid, 3, 'int16'); %signal_type: 0amp/1aux/2sup/3adc
    fwrite(fid, 1, 'int16');
    fwrite(fid, channel, 'int16');
    fwrite(fid, 1, 'int16');
    fwrite(fid, 0, 'int16');
    fwrite(fid, 0, 'int16');
    fwrite(fid, 0, 'int16');
    fwrite(fid, 0, 'int16');
    fwrite(fid, 0, 'single');
    fwrite(fid, 0, 'single');
end

% % Write data
% for i = 1:data_struct.num_data_blocks
%     fwrite(fid, data_struct.t_amplifier(i, :), 'int32');
%     fwrite(fid, data_struct.amplifier_data(:, i), 'uint16');
%     % Add other data types (e.g., aux input, supply voltage, digital I/O)
% end

fclose(fid);
fprintf('File saved to %s\n', filename_output);
end

function write_QString(fid, str)
    if isempty(str)
        % Write a null QString (length 0xFFFFFFFF).
        fwrite(fid, hex2dec('0'), 'uint32');
    else
        % Calculate the length of the string in bytes.
        len = length(str) * 2; % Each character is 2 bytes in UTF-16LE.
        fwrite(fid, len, 'uint32'); % Write the correct byte length.
        fwrite(fid, uint16(str), 'uint16'); % Write the string as UTF-16LE.
    end
end

