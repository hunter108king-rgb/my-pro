
import pygame
import math

pygame.init()

WIDTH, HEIGHT = 1000, 650
screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("Flying Dragon")

clock = pygame.time.Clock()

# Dragon position
x = -150
y = 300

speed = 3
wave = 0

running = True

while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    # Background
    screen.fill((5, 5, 20))

    # Dragon movement
    x += speed
    wave += 0.08

    # Make dragon fly up and down
    dragon_y = y + math.sin(wave) * 80

    # Reset when dragon leaves screen
    if x > WIDTH + 150:
        x = -150

    # Dragon body
    pygame.draw.ellipse(
        screen,
        (120, 30, 30),
        (x - 60, dragon_y - 35, 130, 70)
    )

    # Dragon head
    pygame.draw.circle(
        screen,
        (160, 40, 40),
        (x + 65, dragon_y - 10),
        35
    )

    # Horns
    pygame.draw.polygon(
        screen,
        (230, 180, 50),
        [
            (x + 50, dragon_y - 35),
            (x + 45, dragon_y - 70),
            (x + 65, dragon_y - 40)
        ]
    )

    pygame.draw.polygon(
        screen,
        (230, 180, 50),
        [
            (x + 75, dragon_y - 35),
            (x + 90, dragon_y - 65),
            (x + 90, dragon_y - 30)
        ]
    )

    # Eye
    pygame.draw.circle(
        screen,
        (255, 220, 0),
        (x + 78, dragon_y - 18),
        6
    )

    # Eye pupil
    pygame.draw.circle(
        screen,
        (0, 0, 0),
        (x + 80, dragon_y - 18),
        2
    )

    # Wing movement
    wing = math.sin(wave * 3) * 30

    # Upper wing
    pygame.draw.polygon(
        screen,
        (80, 20, 100),
        [
            (x - 20, dragon_y - 20),
            (x - 80, dragon_y - 100 - wing),
            (x + 15, dragon_y - 45)
        ]
    )

    # Lower wing
    pygame.draw.polygon(
        screen,
        (80, 20, 100),
        [
            (x - 15, dragon_y + 15),
            (x - 70, dragon_y + 90 + wing),
            (x + 20, dragon_y + 35)
        ]
    )

    # Tail
    pygame.draw.line(
        screen,
        (120, 30, 30),
        (x - 55, dragon_y + 5),
        (x - 130, dragon_y + 30),
        15
    )

    # Tail tip
    pygame.draw.polygon(
        screen,
        (180, 40, 40),
        [
            (x - 125, dragon_y + 30),
            (x - 155, dragon_y + 10),
            (x - 150, dragon_y + 45)
        ]
    )

    # Fire
    fire_size = 15 + abs(math.sin(wave * 5)) * 10

    pygame.draw.polygon(
        screen,
        (255, 100, 0),
        [
            (x + 98, dragon_y),
            (x + 98 + fire_size, dragon_y - 10),
            (x + 98 + fire_size + 15, dragon_y),
            (x + 98 + fire_size, dragon_y + 10)
        ]
    )

    pygame.display.flip()
    clock.tick(60)

pygame.quit()
```
