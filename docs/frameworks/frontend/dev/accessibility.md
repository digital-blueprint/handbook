# Accessibility
A simple and basic accessibility guide can be found on [www.w3.org](https://www.w3.org/WAI/test-evaluate/preliminary/){:target="_blank"}.

## Keyboard-friendly
Our application should be keyboard-friendly. That means you can use the app without a mouse.
The most common way of navigating using a keyboard is with the tab key. You can jump between areas and 
the active area should be optically highlighted.

The use of aria landmarks for the app structure are highly recommended. [Learn more about ARIA landmarks](https://w3c.github.io/aria/#landmark){:target="_blank"}.
But authors must not use them for content.


## Colors & Minimal Contrast Level
Colors take a very important part in accessibility topics.
We must think about: older users with bad color sight, users with partial sight, 
users with color-blindness, people using limited color monochrome displays.

For more information read [www.w3.org](https://www.w3.org/WAI/WCAG21/Understanding/use-of-color.html){:target="_blank"}.


### Minimal Contrast Level
So our approach is, that all used colored elements and their backgrounds uses a minimal contrast level of 
 **WCAG AA**. This includes Large Text 18pt+, Graphical Objects, User Interface Components and small Text < 18pt on their background.

You can find a common used contrast checker on [webaim.org](https://webaim.org/resources/contrastchecker/){:target="_blank"} 
or on [contrastchecker.com](https://contrastchecker.com/){:target="_blank"}.

### Include a Text or Icon cue for colored information
Your application should work in monochrom colors. This means e.g.: if you are using a red Text for an
error message. The message itself should state that an error occurs.

## Fontsize
The minimal font size of our application should be **16pt**.
Avoid absolute units like pixels. Instead, use **relative sites**(em, rem), which enable the text to scale depending on other content and screen size.

A user should be able to resize the text up to 400% or change text spacing and no information should be lost.

Learn more about relative units at [developer.mozilla.org](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Values_and_units){:target="_blank"}.

## Touchtarget Size
The minimal touch target size of WCAG Level AAA is at least 44 by 44 css pixels.
The minimal touch target size of WCAG Level AA is at least 24 by 24 CSS pixels.

In our application we had to fulfill WCAG Level AA, but we want to meet in the middle with the touchstart.

So our minimal touch target size is 40px. To achieve that with an aspect to design you can make the content smaller than the actual touch target.
So you wrap the target with a padding. E.g.: an icon with the size of 30px and a padding of 5 px at each side.


For more information you can read the article about [touch target size](https://www.w3.org/WAI/WCAG21/Understanding/target-size.html){:target="_blank"} of w3.org.

## Hierarchy of Headlines
Heading levels should have a meaningful hierarchy, e.g.:

    Heading Level 1 <h1>
        Heading Level 2 <h2>
            Heading Level 3 <h3>
            Heading Level 3 <h3>
        Heading Level 2 <h2>
            Heading Level 3 <h3>
                Heading Level 4 <h4>
                Heading Level 4 <h4>
        Heading Level 2 <h2>

In almost all pages there should be at least one heading.
The heading hierarchy should be meaningful. 
Ideally the page starts with a "h1" — which is usually similar to the page title — and does not skip levels.


## Text alternatives

### Non Text content: ALT attribute
You must add an ALT attribute to each non text content, including image, buttons, graphics, icons, video, audio files. 
This improves the SEO and also the accessibility.
You should briefly describe the image in an ALT attribute.

### Link titles
All links should have a meaningful title attribute.


### Labels for User input
You should use labels for form controls, input and other user interface components