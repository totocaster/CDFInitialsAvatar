# CDFInitialsAvatar

Simple to use initials avatar generator for iOS. Highly customizable, but with sane defaults. Work great as a avatar placeholder and such.

## Usage

Defaults mimic look of Apple's own implementation of initial avatars, found in  Contact.app and Messages.app on iPhone or OS X. Thus, usage can be as simple those who lines:

```objc
	CDFInitialsAvatar *initialsAvatar = [[CDFInitialsAvatar alloc] initWithRect imageView.bounds fullName:@"Toto Tvalavadze"];
	imageView.image = initialsAvatar.imageRepresentation; // actual drawing happens here
```

### Further Customizations

You are free to change `backgroundColor`, `initilasFont` and `initialsColor`. This should cover everything. For details, refer to header file. It's well documented.

Example project also contains usage samples.

### What About Circle Avatars?

I believe generator should be responsible for content only, thus in case you want to mask content with circle (or pretty much any shape you want), please consider `mask` layer of your `UIImageView`.

## Caching

`CDFInitialsAvatar` **does not** cache images it generates. Consider implementing your choice of image caching strategy when using it inside a cell views or in similar cases. In short, treat `imageView.image = initialsAvatar.imageRepresentation` as a very expensive call (which it is).

## Rendering

Actual drawing happens when `imageRepresentation` is called and obviously, is expensive. Consider using it wisely and wrapping it with your choice of caching strategy if needed.

No drawing or/and calculations happen on `initWith...`.

## License

MIT. Included in source files.