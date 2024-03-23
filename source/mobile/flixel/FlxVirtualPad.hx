package mobile.flixel;

import mobile.objects.TouchButton;
import haxe.io.Path;
import flixel.graphics.frames.FlxTileFrames;
import mobile.flixel.input.FlxMobileInputManager;
import flixel.math.FlxPoint;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.FlxGraphic;
import openfl.utils.Assets;
import openfl.utils.AssetType;
import openfl.display.BitmapData;

/**
 * A gamepad.
 * It's easy to customize the layout.
 *
 * @author Ka Wing Chin, Mihai Alexandru, Karim Akra & Lily (mcagabe19)
 */
class FlxVirtualPad extends FlxMobileInputManager<TouchPadButton> {
	public var buttonLeft:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.LEFT, FlxMobileInputID.noteLEFT]);
	public var buttonUp:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.UP, FlxMobileInputID.noteUP]);
	public var buttonRight:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.RIGHT, FlxMobileInputID.noteRIGHT]);
	public var buttonDown:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.DOWN, FlxMobileInputID.noteDOWN]);
	public var buttonLeft2:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.LEFT2, FlxMobileInputID.noteLEFT]);
	public var buttonUp2:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.UP2, FlxMobileInputID.noteUP]);
	public var buttonRight2:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.RIGHT2, FlxMobileInputID.noteRIGHT]);
	public var buttonDown2:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.DOWN2, FlxMobileInputID.noteDOWN]);
	public var buttonA:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.A]);
	public var buttonB:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.B]);
	public var buttonC:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.C]);
	public var buttonD:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.D]);
	public var buttonE:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.E]);
	public var buttonF:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.F]);
	public var buttonG:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.G]);
	public var buttonH:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.H]);
	public var buttonI:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.I]);
	public var buttonJ:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.J]);
	public var buttonK:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.K]);
	public var buttonL:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.L]);
	public var buttonM:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.M]);
	public var buttonN:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.N]);
	public var buttonO:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.O]);
	public var buttonP:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.P]);
	public var buttonQ:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.Q]);
	public var buttonR:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.R]);
	public var buttonS:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.S]);
	public var buttonT:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.T]);
	public var buttonU:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.U]);
	public var buttonV:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.V]);
	public var buttonW:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.W]);
	public var buttonX:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.X]);
	public var buttonY:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.Y]);
	public var buttonZ:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.Z]);
	public var buttonExtra:TouchPadButton = new TouchPadButton(0, 0);
	public var buttonExtra2:TouchPadButton = new TouchPadButton(0, 0);
	/*
	public var buttonZero:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.ZERO]);
	public var buttonOne:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.ONE]);
	public var buttonTwo:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.TWO]);
	public var buttonThree:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.THREE]);
	public var buttonFour:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.FOUR]);
	public var buttonFive:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.FIVE]);
	public var buttonSix:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.SIX]);
	public var buttonSeven:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.SEVEN]);
	public var buttonEight:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.EIGHT]);
	public var buttonNine:TouchPadButton = new TouchPadButton(0, 0, [FlxMobileInputID.NINE]);
	*/

	/**
	 * Create a gamepad.
	 *
	 * @param   DPadMode     The D-Pad mode. `LEFT_FULL` for example.
	 * @param   ActionMode   The action buttons mode. `A_B_C` for example.
	 */
	public function new(DPad:String, Action:String, ?Extra:ExtraActions = NONE) {
		super();

		if (DPad != "NONE") {
			if (!MobileData.dpadModes.exists(DPad))
				throw 'The virtualPad dpadMode "$DPad" doesn\'t exists.';
			for (buttonData in MobileData.dpadModes.get(DPad).buttons) {
				Reflect.setField(this, buttonData.button,
					createButton(buttonData.x, buttonData.y, buttonData.graphic, CoolUtil.colorFromString(buttonData.color),
					Reflect.getProperty(this, buttonData.button).IDs));
				add(Reflect.field(this, buttonData.button));
			}
		}

		if (Action != "NONE") {
			if (!MobileData.actionModes.exists(Action))
				throw 'The virtualPad actionMode "$Action" doesn\'t exists.';
			for (buttonData in MobileData.actionModes.get(Action).buttons) {
				Reflect.setField(this, buttonData.button,
					createButton(buttonData.x, buttonData.y, buttonData.graphic, CoolUtil.colorFromString(buttonData.color),
					Reflect.getProperty(this, buttonData.button).IDs));
				add(Reflect.field(this, buttonData.button));
			}
		}

		switch (Extra) {
			case SINGLE:
				add(buttonExtra = createButton(0, FlxG.height - 137, 's', 0xFF0066FF));
				setExtrasPos();
			case DOUBLE:
				add(buttonExtra = createButton(0, FlxG.height - 137, 's', 0xFF0066FF));
				add(buttonExtra2 = createButton(FlxG.width - 132, FlxG.height - 137, 'g', 0xA6FF00));
				setExtrasPos();
			case NONE: // nothing
		}

		scrollFactor.set();
		updateTrackedButtons();
	}

	override function update(elapsed:Float)
	{
		/*
		forEachAlive((button:TouchPadButton) -> {
			if(!button.isOnScreen(button.camera))
			{
				if(button.x < 0)
					button.x = 0;
				if(button.y < 0)
					button.y = 0;
				if(button.x > FlxG.width - button.frameWidth)
					button.x = FlxG.width - button.frameWidth;
				if(button.y > FlxG.height - button.frameHeight)
					button.y = FlxG.height - button.frameHeight;
			}
		});
		*/
		super.update(elapsed);
	}

	override public function destroy() {
		super.destroy();

		for (field in Reflect.fields(this))
			if (Std.isOfType(Reflect.field(this, field), TouchPadButton))
				Reflect.setField(this, field, FlxDestroyUtil.destroy(Reflect.field(this, field)));
	}

	public function setExtrasDefaultPos() {
		var int:Int = 0;

		if (MobileControls.save.data.extraData == null)
			MobileControls.save.data.extraData = new Array();

		for (button in Reflect.fields(this)) {
			if (button.toLowerCase().contains('extra') && Std.isOfType(Reflect.field(this, button), TouchPadButton)) {
				var daButton = Reflect.field(this, button);
				if (MobileControls.save.data.extraData[int] == null)
					MobileControls.save.data.extraData.push(FlxPoint.get(daButton.x, daButton.y));
				else
					MobileControls.save.data.extraData[int] = FlxPoint.get(daButton.x, daButton.y);
				++int;
			}
		}
		MobileControls.save.flush();
	}

	public function setExtrasPos() {
		var int:Int = 0;
		if (MobileControls.save.data.extraData == null)
			setExtrasDefaultPos();

		for (button in Reflect.fields(this)) {
			if (button.toLowerCase().contains('extra') && Std.isOfType(Reflect.field(this, button), TouchPadButton)) {
				if(MobileControls.save.data.extraData.length > int)
					setExtrasDefaultPos();
				var daButton = Reflect.field(this, button);
				daButton.x = MobileControls.save.data.extraData[int].x;
				daButton.y = MobileControls.save.data.extraData[int].y;
				int++;
			}
		}
	}

	private function createButton(X:Float, Y:Float, Graphic:String, ?Color:Int = 0xFFFFFF, ?IDs:Array<FlxMobileInputID>):TouchPadButton {
		var button = new TouchPadButton(X, Y, IDs, Graphic.toUpperCase());
		button.bounds.makeGraphic(Std.int(button.width - 50), Std.int(button.height - 50), FlxColor.TRANSPARENT);
		button.centerBounds();
		button.color = Color;
		trace(button.width + ' - ' + button.height);
		#if FLX_DEBUG
		button.ignoreDrawDebug = true;
		#end
		return button;
	}
}

class TouchPadButton extends TouchButton
{
	public function new(X:Float = 0, Y:Float = 0, ?IDs:Array<FlxMobileInputID>, ?labelGraphic:String){
		super(X, Y, IDs);
		if(labelGraphic != null){
			label = new FlxSprite();
			loadGraphic(Paths.image('touchpad/bg', "mobile"));
			label.loadGraphic(Paths.image('touchpad/$labelGraphic', "mobile"));
			scale.set(0.243, 0.243);
			updateHitbox();
			updateLabelPosition();
			statusAlphas = [ClientPrefs.data.controlsAlpha, ClientPrefs.data.controlsAlpha - 0.05, ClientPrefs.data.controlsAlpha-0.12];
			labelAlphaDiff = 0.08;
			solid = false;
			immovable = true;
			moves = false;
			antialiasing = ClientPrefs.data.antialiasing;
			tag = labelGraphic.toUpperCase();
		}
	}
}