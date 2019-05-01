CREATE OR REPLACE PROCEDURE ADDALBUM (
        in_id IN album.id%type,
        in_name IN album.name%type)
    IS 
    BEGIN 
        INSERT INTO album (id,name) 
         VALUES(in_id, in_name); 
        dbms_output.put_line('Added '||in_name||' to Album!'); 
    EXCEPTION
        WHEN others THEN 
            dbms_output.put_line('Error!'); 
END ADDALBUM; 
/
    
CREATE OR REPLACE PROCEDURE ADDARTIST(
        in_id IN artist.id%type,
        in_name IN artist.name%type,
        in_about IN artist.about%type)
    IS 
    BEGIN 
        INSERT INTO artist (id,name,about) 
         VALUES(in_id, in_name, in_about); 
        dbms_output.put_line('Added '||in_name||' to Artist!'); 
    EXCEPTION
        WHEN others THEN 
            dbms_output.put_line('Error!'); 
END ADDARTIST;
/
    
CREATE OR REPLACE PROCEDURE ADDSONG (
        in_id IN song.id%type,
        in_name IN song.name%type,
        in_album_id IN song.album_id%type,
        in_genre IN song.genre%type,
        in_play_count IN song.play_count%type,
        in_song_num IN song.song_num%type,
        in_mp3 IN song.mp3%type)
    IS 
    BEGIN 
        INSERT INTO song (id,name, album_id, genre, play_count, song_num, mp3) 
         VALUES(in_id, in_name, in_album_id, in_genre, in_play_count, in_song_num, in_mp3); 
        dbms_output.put_line('Added '||in_name||' to Songs!'); 
    EXCEPTION
        WHEN others THEN 
            dbms_output.put_line('Error!'); 
END ADDSONG; 
/


CREATE OR REPLACE PROCEDURE ADDSONGARTIST (
        in_song_id IN song_artist.song_id%type,
        in_artist_id IN song_artist.artist_id%type)
    IS 
    BEGIN 
        INSERT INTO song_artist (song_id, artist_id) 
         VALUES(in_song_id, in_artist_id); 
    EXCEPTION
        WHEN others THEN 
            dbms_output.put_line('Error!'); 
END ADDSONGARTIST; 
/

CREATE OR REPLACE PROCEDURE ADDSONGTOHISTORY (
    in_user_id IN userDetails.username%type,
    in_song_id IN song_artist.song_id%type)
    IS
    BEGIN
        INSERT INTO history (user_id, song_id, last_played) 
         VALUES(in_user_id, in_song_id, SYSDATE); 
    EXCEPTION
        WHEN others THEN 
            dbms_output.put_line('Error!'); 
END ADDSONGTOHISTORY; 
/

