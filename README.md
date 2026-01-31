# Aakash Baskaran - Portfolio

A personal portfolio website showcasing my projects and skills as an AEM Developer.

## Live Demo

[View Live Site](https://yourusername.github.io/aakash-portfolio/)

## Preview

![Portfolio Screenshot](images/portfolio-preview.png)

## Features

- Clean, modern design
- Fully responsive (mobile, tablet, desktop)
- Fast loading (static HTML/CSS)
- No JavaScript dependencies
- Accessible design

## Sections

### Hero Banner
- Introduction with name and role
- Call-to-action buttons (Projects, LinkedIn)
- Professional image

### Projects
- Alternating card layout
- Project descriptions with links
- Hover effects on buttons

### Footer
- Social media links (LinkedIn, GitHub, Email)
- Copyright information

## Technologies Used

| Technology | Purpose |
|------------|---------|
| HTML5 | Semantic markup |
| CSS3 | Styling & animations |
| Flexbox | Responsive layouts |
| GitHub Pages | Hosting |

## Color Palette

| Color | Hex | Usage |
|-------|-----|-------|
| Yellow | `#FDC435` | Accent, buttons |
| Dark Gray | `#25282B` | Text, headings |
| Light Gray | `#828282` | Secondary text |
| Off White | `#F9FAFF` | Background |
| White | `#FFFFFF` | Cards |

## Project Structure

```
portfolio/
├── index.html          # Main page
├── css/
│   ├── site.css        # Global styles
│   ├── header.css      # Header styles
│   ├── hero.css        # Hero banner styles
│   ├── project-card.css # Project cards
│   ├── section-title.css # Section headings
│   └── footer.css      # Footer styles
├── images/
│   ├── hero-banner-image.png
│   ├── project1_img.png
│   ├── project2_img.png
│   └── project3_img.png
└── icons/
    ├── linkedin.svg
    ├── github.svg
    └── email.svg
```

## Local Development

1. Clone the repository
   ```bash
   git clone https://github.com/yourusername/aakash-portfolio.git
   ```

2. Open `index.html` in your browser
   ```bash
   # Or use a local server
   npx serve .
   ```

## Deployment to GitHub Pages

1. Push code to GitHub
   ```bash
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```

2. Enable GitHub Pages
   - Go to Settings > Pages
   - Source: Deploy from branch
   - Branch: main / root
   - Save

3. Access your site at:
   ```
   https://yourusername.github.io/aakash-portfolio/
   ```

## Customization

### Change Colors
Edit the color values in each CSS file:
```css
/* Primary accent color */
background-color: #FDC435;

/* Text colors */
color: #25282B;  /* Dark */
color: #828282;  /* Light */
```

### Update Content
Edit `index.html` to update:
- Your name and title
- Project descriptions
- Social media links
- Images

### Add More Projects
Copy a project card section and update:
```html
<div class="projects-card-container">
  <div class="project-card-content">
    <h2>New Project</h2>
    <p>Project description...</p>
    <a href="#" class="btn">View Project</a>
  </div>
  <img class="project-card-image" src="images/new-project.png" alt="Project"/>
</div>
```

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## Performance

- Lighthouse Score: 95+
- No external dependencies
- Optimized images
- Minimal CSS

## Contact

**Aakash Baskaran** - AEM Developer

- Website: [aakashbaskaran.com](https://aakashbaskaran.com)
- LinkedIn: [linkedin.com/in/aakashbaskaran](https://www.linkedin.com/in/aakashbaskaran/)
- GitHub: [github.com/ash6898](https://github.com/ash6898/)
- Email: aakash.baskaran.1305@gmail.com

## License

This project is open source and available under the [MIT License](LICENSE).

---

Built with passion by Aakash Baskaran
