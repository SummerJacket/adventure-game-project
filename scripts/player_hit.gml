/// player_hit(camera_shake_step, camera_shake_strengh, hit_stun, effect_colour)
with (obj_player) {
    if (!invulnerable) {
        invulnerable = true
        hit_points--
        if (hit_points = 0) {
            obj_player.game_over = true
            global.paused = true
        }
        shake_camera(argument0, argument1)
        hit_stun(argument2)
        score_num = -500
        game_score += score_num
        score_effect(x, y, score_num)
        
        effect_create_above(ef_ring, other.x, other.y, 5, argument3)
        audio_play_sound(sfx_lose, 0, false)
        
        alarm[0] = 3 * room_speed // set vulnerability
        alarm[1] = 1 // blink
    }
}