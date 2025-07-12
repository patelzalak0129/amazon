// Main JavaScript functionality
class ReWearApp {
  constructor() {
    this.init()
  }

  init() {
    this.setupEventListeners()
    this.loadFeaturedItems()
    this.checkAuthStatus()
  }

  setupEventListeners() {
    // Mobile menu toggle
    const mobileToggle = document.querySelector(".mobile-menu-toggle")
    if (mobileToggle) {
      mobileToggle.addEventListener("click", this.toggleMobileMenu)
    }

    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
      anchor.addEventListener("click", function (e) {
        e.preventDefault()
        const target = document.querySelector(this.getAttribute("href"))
        if (target) {
          target.scrollIntoView({
            behavior: "smooth",
          })
        }
      })
    })
  }

  toggleMobileMenu() {
    const navLinks = document.querySelector(".nav-links")
    navLinks.classList.toggle("mobile-open")
  }

  loadFeaturedItems() {
    const featuredItems = [
      {
        id: 1,
        title: "Vintage Denim Jacket",
        image: "/placeholder.svg?height=300&width=300",
        points: 25,
        condition: "Good",
        size: "M",
        category: "Outerwear",
        featured: true,
      },
      {
        id: 2,
        title: "Floral Summer Dress",
        image: "/placeholder.svg?height=300&width=300",
        points: 20,
        condition: "Excellent",
        size: "S",
        category: "Dresses",
        featured: true,
      },
      {
        id: 3,
        title: "Designer Sneakers",
        image: "/placeholder.svg?height=300&width=300",
        points: 35,
        condition: "Good",
        size: "9",
        category: "Shoes",
        featured: true,
      },
      {
        id: 4,
        title: "Wool Winter Coat",
        image: "/placeholder.svg?height=300&width=300",
        points: 40,
        condition: "Excellent",
        size: "L",
        category: "Outerwear",
        featured: false,
      },
    ]

    this.renderFeaturedItems(featuredItems)
  }

  renderFeaturedItems(items) {
    const track = document.querySelector(".carousel-track")
    if (!track) return

    track.innerHTML = items
      .map(
        (item) => `
            <div class="item-card" onclick="window.location.href='item-detail.html?id=${item.id}'">
                <div class="item-image">
                    <img src="${item.image}" alt="${item.title}">
                    <div class="item-badges">
                        <span class="badge badge-primary">${item.points} pts</span>
                        ${item.featured ? '<span class="badge badge-warning"><i class="fas fa-star"></i> Featured</span>' : ""}
                    </div>
                </div>
                <div class="item-info">
                    <h3 class="item-title">${item.title}</h3>
                    <div class="item-details">
                        <span>Size: ${item.size}</span>
                        <span>${item.condition}</span>
                    </div>
                    <div class="item-meta">
                        <span class="badge badge-secondary">${item.category}</span>
                    </div>
                </div>
            </div>
        `,
      )
      .join("")
  }

  checkAuthStatus() {
    const user = localStorage.getItem("rewear_user")
    const navLinks = document.querySelector(".nav-links")

    if (user && navLinks) {
      const userData = JSON.parse(user)
      navLinks.innerHTML = `
                <a href="browse.html" class="nav-link">Browse</a>
                <a href="list-item.html" class="nav-link">List Item</a>
                <a href="dashboard.html" class="nav-link">Dashboard</a>
                <button class="btn btn-secondary btn-sm" onclick="app.logout()">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </button>
            `
    }
  }

  logout() {
    localStorage.removeItem("rewear_user")
    localStorage.removeItem("rewear_token")
    window.location.href = "index.html"
  }

  // Utility functions
  showAlert(message, type = "info") {
    const alertDiv = document.createElement("div")
    alertDiv.className = `alert alert-${type}`
    alertDiv.innerHTML = `
            <i class="fas fa-${type === "success" ? "check-circle" : type === "error" ? "exclamation-circle" : "info-circle"}"></i>
            ${message}
        `

    document.body.insertBefore(alertDiv, document.body.firstChild)

    setTimeout(() => {
      alertDiv.remove()
    }, 5000)
  }

  formatDate(dateString) {
    const date = new Date(dateString)
    return date.toLocaleDateString("en-US", {
      year: "numeric",
      month: "short",
      day: "numeric",
    })
  }

  generateAvatar(name) {
    return name
      .split(" ")
      .map((n) => n[0])
      .join("")
      .toUpperCase()
  }
}

// Initialize the app
const app = new ReWearApp()

// Export for use in other files
window.ReWearApp = ReWearApp
window.app = app
